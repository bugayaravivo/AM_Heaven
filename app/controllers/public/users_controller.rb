class Public::UsersController < ApplicationController
  
  
  def show
    @user = current_user
    @posts = current_user.posts
  end

  def edit
    @user = current_user
  end
  
  def update
    user = current_user
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
    params.require(:user).permit(:name, :introduction, :email, :is_active)
  end
end
