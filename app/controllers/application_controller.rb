class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] # return @current_user if not exist then only do User.find
  end

  def logged_in?
    !!current_user   #turn any variable into a boolean by, current_user is the method right before !!
  end

  def require_user
    if !logged_in?
      flash[:alert] = "You must be logged in to perform that action"
      redirect_to login_path
    end
  end
end
