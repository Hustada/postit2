class SessionsController < ApplicationController
  def new

  end

  def create
    #get handle on user (username)
    user = User.find_by(username: params[:username])
    #call authenticate on that user, pass in password
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome, you are now free to move about the cabin"
      redirect_to root_path
    else
      flash[:error] = "Something is wrong with your username or password"
      redirect_to login_path
  end
end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have logged out"
    redirect_to root_path
  end
end