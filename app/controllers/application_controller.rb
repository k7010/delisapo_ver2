class ApplicationController < ActionController::Base
helper_method :current_user

  def login?
    if current_user.nil?
      redirect_to login_path
    end
  end

  def already_login?
    unless current_user.nil?
      redirect_to root_path
    end
  end
  
  def current_user
    if session[:user_id]
      current_user ||= User.find(session[:user_id])
    end
  end
end
