class Admin::UsersController < ApplicationController
  
  layout 'admin_layout'

  before_action :authenticate_user!
  before_action :set_user, only: [:edit, :update, :update_password, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation))
    if @user.valid?
      @user.save!
      flash[:notice] = 'User created'
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @user.assign_attributes(user_params)
    if @user.valid?
      @user.save!
      flash[:notice] = 'User updated'
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def update_password
    @user.assign_attributes(password_params)
    if @user.valid?
      @user.save!
      flash[:notice] = 'Password updated'
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = 'User deleted'
    redirect_to admin_users_path
  end



  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
