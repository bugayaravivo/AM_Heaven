class Public::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :post_guest_user, only: [:new,:edit]
  
  def new
    @post = Post.new
  end
  
  def create
    @post = current_user.posts.new(post_params)
    
    if @post.save
      redirect_to post_path(@post.id)
    else
      render :new
    end 
  end 

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.order(created_at: :desc)
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render edit
    end 
  end 
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end 
  
  private
  
  def post_params
    params.require(:post).permit(:title, :body, :address, :user_id, :post_image)
  end 
  
  def post_guest_user
    @user = current_user
    if @user.email == "guest@example.com"
      redirect_to user_path(current_user), notice: "ゲストユーザーなので新規投稿できません。"
    end
  end  
end
