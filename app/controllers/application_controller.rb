class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user
  helper_method :current_user, :current_user?, :current_admin_user

  def current_user
    @current_user || User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def current_user?(user)
    session[:user_id] == user.id
  end

  def require_logged_in_user
    unless current_user
      flash[:error] = ["This area is only for logged in users."]
      redirect_to root_path
    end
  end

  def require_authenticated_user(user)
    unless current_user?(user)
      flash[:error] = ["You don't have access to this page"]
      redirect_to root_path
    end
  end

def authenticate_admin_user!
  redirect_to root_path unless current_user.try(:is_admin?)
end


  def current_admin_user
    @current_admin_user || User.find_by(id: session[:user_id]) if session[:user_id] && User.find_by(id: session[:user_id]).admin == true
  end
end
