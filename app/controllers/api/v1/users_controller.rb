# module Api
#     module V1
#         class UsersController < ApplicationController
#             before_action :authenticate_user!
#             before_action :set_user, only: [:show, :edit, :update, :destroy]
        
#             def edit
#             end
        
#             def update
#                 @user.update(user_params)
#             end
        
            
        
#             private
#                 def set_user
#                     @user = User.find(params[:id])
#                 end
        
#                 def user_params
#                     params.require(:user).permit(:id, :email, :username, :image, :date_of_birth)
#                 end
        
#                 def check_user
#                     if @user != current_user
#                         redirect_to new_user_session_path
#                     end
#                 end
#         end
#     end
# end
