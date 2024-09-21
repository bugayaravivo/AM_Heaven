class Public::CommentsController < ApplicationController
  
  
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = @post.id
    
    if @comment.save
      redirect_to post_path(@post.id), notice: "コメントを作成しました"
    else
      redirect_to post_path(@post.id), alert: "コメントを作成に失敗しました"
    end 
  end 
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_path(@comment.post_id), notice: "コメントを削除しました"
  end 
  
  private
  
  def comment_params
    params.require(:comment).permit(:body)
  end 
end
