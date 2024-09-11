class Public::UsersController < ApplicationController
  
  
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
  end
  
  def withdraw
  end 
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :email, :user_image, :is_active)
  end
end
