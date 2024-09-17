class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    user = User.find(params[:id])
    if user.update(user_params)
      redirect_to users_path(current_user)
    else
      render :edit
    end 
  end 

  def unsubscribe
    @user = current_user
  end
  
  def withdraw
    user_id = current_user.id
    user = User.find(user_id)
    user.update(is_active: false)
    reset_session
    redirect_to root_path
  end 
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :email, :user_image, :is_active)
  end
  
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.email == "guest@example.com"
      redirect_to user_path(current_user), notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end  
end
