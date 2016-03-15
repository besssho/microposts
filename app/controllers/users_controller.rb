class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :check_user, only: [:edit, :update]
  
  def show
    set_user
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
    render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile, :area)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def check_user
    set_user 
    redirect_to root_path flash[:danger] = "Access denied" unless @user == current_user
  end
end