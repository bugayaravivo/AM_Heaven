class Public::UsersController < ApplicationController
  
  
  def show
    @user = current_user.user.find(params[:id])
    @posts = current_user.post.all
  end

  def edit
    
  end
  
  def update
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
