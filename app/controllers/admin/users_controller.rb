class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    if params[:keyword].present?
      @users = User.where("name like ?", "%#{params[:keyword]}%" )
    else
      @users = User.all
    end 
    
    if params[:is_active].present?
      @users = User.where(is_active: params[:is_active] == "true")
    else
      @users = User.all
    end 
    
    @users = User.page(params[:page]).per(10)
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
