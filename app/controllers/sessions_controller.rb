class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
     if user && user.authenticate(params[:session][:password])
       session[:user_id] = user.id  #assign the user.id as the current session user_id which hold the login state for current user
       flash[:notice] = "Login successfully"
       redirect_to user
     else
       flash.now[:alert] = "There was something wrong with your login details"
       render 'new'
     end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to root_path
  end

end
