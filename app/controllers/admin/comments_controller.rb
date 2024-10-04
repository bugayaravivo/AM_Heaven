class Admin::CommentsController < ApplicationController
  
  
  def index
    @user = User.find(params[:user_id])
    @comments = @user.comments.page(params[:page]).per(10)
  end 
  
  def destroy
    @user = User.find(params[:user_id])
    comment = @user.comments.find(params[:id])
    comment.destroy
    redirect_to admin_user_comments_path(@user.id), notice: 'コメントを削除しました'
  end 
  
  def destroy_all
    user = User.find(params[:id])
    user.comments.destroy_all
    redirect_to admin_user_comments_path(user.id)
  end 
  
  private
  
  def comment_params
    params.require(:comment).permit(:body)
  end 
end
