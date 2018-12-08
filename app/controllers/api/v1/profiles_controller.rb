module Api
    module V1
        class ProfilesController < ApplicationController    
            before_action :set_user, only: [:show, :update, :destroy]
            
            def update
                if @profile.update_attributes(profile_params)
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
        
            private
                def set_user
                    @user = User.find(params[:id])
                end
        
                def profile_params
                    params.require(:user).permit(:id, :user_id, :name, :age, :gender, :language, :description, :address, :profile_longitude, :profile_latitude, :profile_pic, :isVerified)
                end
        end
    end
end
