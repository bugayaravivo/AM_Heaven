class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @users = User.all
    if params[:keyword].present?
      @users = @users.where("name like ?", "%#{params[:keyword]}%" )
    end 
    
    if params[:is_active].present?
      @users = @users.where(is_active: params[:is_active] == "true")
    end 
    
    @users = @users.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user.id)
    else
      render edit
    end 
  end 
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :email, :user_image, :is_active)
  end 
end
