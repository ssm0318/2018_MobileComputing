module Api
    module V1
        class ProfilesController < ApplicationController    
            before_action :set_user, only: [:show, :update, :destroy, :update]

            def update
                if @profile.update_attributes(profile_params)
                    @profile.profile_tags.destroy_all if !@profile.profile_tags.nil?
                    input_tag = @profile.profile_tag_raw
                    input_tag = input_tag.gsub(", ", ",") # windows에서는 \r\n인데 mac에서는 \n이다.
                    tag_array = input_tag.split(",") 
                    tag_array.each do |tag|
                        new_tag = ProfileTag.create(profile_id: @profile.id, content: tag)
                        @profile.profile_tags << ProfileTag.find(new_tag.id)
                    end
                    render json: {status: 'SUCCESS', message:'Updated profile', data: @profile}, status: :ok
                else
                    render json: {status: 'ERROR', message:'Profile not updated', data: @profile.errors.full_messages}, status: :unprocessable_entity
                end
            end

            def index
                @profiles = Profile.order('created_at DESC')
                render 'profiles/index.json'
            end
        
            def show
                @profile = @user.profile
                render 'profiles/show.json'
            end

            def mypage
                @profile = current_user.profile
                render 'profiles/mypage.json'
            end

            # def search
            #     @keyword = params[:keyword]
            #     @location = params[:location]
            #     profileSearch = Profile.order('created_at DESC')
            #     profileSearch = profileSearch.search_profile(@keyword).distinct if @keyword.present?

            #     render json: {status: 'SUCCESS', message:'search results', data: profileSearch}, status: :ok
            # end

            def review
                host_id = params[:id]
                author_id = parmas[:author_id]
                rating = params[:rating]
                content = params[:content]
                review = Review.create(host_id: host_id, author_id: author_id, rating: rating, content: content)

                render json: {status: 'SUCCESS', message: 'review submitted', data: review}, status: :ok
            end

            def follow
                follower_id = params[:follower_id]
                following_id = parmas[:following_id]
                follow = Follow.create(follower_id: follower_id, following_id: following_id)

                render json: {status: 'SUCCESS', message: 'follow user', data: follow}, status: :ok
            end

            def match
                @user_id = params[:id]
                @gender = params[:gender] if params[:gender].present?
                @language = params[:language] if params[:language].present?
                @origin = params[:location] if params[:location].present?

                profile_match = Profile.all
                profile_match = profile_match.where(gender: @gender).distinct if !@gender.nil?
                profile_match = profile_match.where("language like ?", "%#{@language}%").distinct if !@language.nil?
                profile_match = profile_match.within(40, :units => :kms, :origin => @origin) if !@origin.nil?
                user = Profile.find(@user_id)

                if !profile_match.blank?
                    profile_match.each do |profile| 
                        age_diff = (profile.age - user.age).abs
                        exp = profile.exp
                        exp = 0.1

                        rate_sum = 0.0
                        num_rate = 0.001 
                        profile.user.received_reviews.each do |review|
                            rate_sum += review.rating
                            num_rate += 1
                        end
                        avg_rate = rate_sum / num_rate

                        num_comm_tag = 0
                        user.profile_tags.each do |orig_tag|
                            if profile.profile_tags.any? {|comp_tag| comp_tag.content.include?(orig_tag.content)}
                                num_comm_tag += 1
                            end
                        end
                        if num_comm_tag == 0
                            num_comm_tag = 0.5
                        end

                        score = age_diff ** (1.0 / num_comm_tag) + (5 - avg_rate) ** Math.log(exp)
                        profile.match_score = score
                        profile.save
                    end
                end

                profile_match = profile_match.order('match_score ASC')

                render json: {status: 'SUCCESS', message:'match users', data: profile_match}, status: :ok
            end
        
            private
                def set_user
                    @user = User.find(params[:id])
                end
        
                def profile_params
                    params.require(:user).permit(:id, :user_id, :name, :age, :gender, :language, :description, :address, :profile_longitude, :profile_latitude, :profile_pic, :isVerified, :exp, :tag_string)
                end
        end
    end
end
