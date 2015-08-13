class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action except: [:new, :create, :show] do
    require_authenticated_user(current_user)
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "Thanks for signing up!"
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def edit
    render :show if (current_user.id != params[:id].to_i && !current_user.is_admin?)
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "Updates saved successfully."
    else
      flash[:errors] = @user.errors.full_messages
      render :edit
    end
  end

  def destroy
    if @user.destroy
      redirect_to root_path, notice: "Account delete succesfully."
    else
      redirect_to @user, notice: "Something went wrong. Account still active."
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :first_name, :last_name, :password, :password_confirmation)
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end
end
