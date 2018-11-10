module Api
    module V1
        class ProfilesController < ApplicationController                    
            def update
                if @profile.update_attributes(profile_params)
                    render json: {status: 'SUCCESS', message:'Updated profile', data: @profile}, status: :ok
                else
                    render json: {status: 'ERROR', message:'Profile not updated', data: @profile.errors.full_messages}, status: :unprocessable_entity
                end
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
