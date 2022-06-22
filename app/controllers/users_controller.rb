class UsersController < ApplicationController
  before_action :already_login?, only: [:new, :create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user_id
      redirect_to login_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:staff_number, :email, :password, :password_confirmation)
  end
end
