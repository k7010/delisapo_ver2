class ApplicationController < ActionController::Base
  helper_method :current_user

  def login?
    redirect_to login_path if current_user.nil?
  end

  def already_login?
    redirect_to root_path unless current_user.nil?
  end

  def current_user
    current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
