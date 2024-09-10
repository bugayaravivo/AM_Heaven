class Public::PostsController < ApplicationController
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
  end

  def edit
  end
  
  def update
  end 
  
  def destroy
  end 
  
  private
  
  def post_params
    params.require(:post).permit(:title, :body, :address, :user_id)
  end 
end
