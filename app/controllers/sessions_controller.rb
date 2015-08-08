class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user.try(:authenticate, params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Welcome back #{user.username}!"
    else
      flash[:errors] = ["Invalid Login"]
      redirect_to root_path
    end
  end

  def logout
    session.clear
    redirect_to root_path, notice: "Logged out successfully."
  end
end
