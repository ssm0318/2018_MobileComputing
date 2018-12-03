class RegisterController < ApplicationController
  before_action :set_user, only: [:info, :infoget]
  before_action :authenticate_user!
  # 카테고리 선택하기 추가
  def info
  end

  def infoget
    @user.nickname = params[:nickname]
    @user.save
    redirect_to visitor_main_path
  end

  private
    def set_user
      @user = current_user
    end
end
