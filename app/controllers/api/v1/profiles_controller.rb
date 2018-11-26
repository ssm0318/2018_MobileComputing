module Api
    module V1
        class ProfilesController < ApplicationController    
            before_action :set_user, only: [:show, :update]
            
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

            def search
                @keyword = params[:keyword]
                @location = params[:location]
                profileSearch = Profile.order('created_at DESC')
                profileSearch = profileSearch.search_profile(@keyword).distinct if @keyword.present?

                render json: {status: 'SUCCESS', message:'search results', data: profileSearch}, status: :ok
            end
        
            private
                def set_user
                    @user = User.find(params[:id])
                end
        
                def profile_params
                    params.require(:user).permit(:id, :user_id, :name, :age, :description, :tag, :address, :longitude, :latitude, :profile_pic, :isVerified)
                end
        end
    end
end
