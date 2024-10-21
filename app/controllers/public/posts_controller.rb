class Public::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :post_guest_user, only: [:new,:edit]
  before_action :ensure_post, only: [:edit]

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      flash[:notice] = "新規投稿に成功しました。"
      redirect_to post_path(@post.id)
    else
      flash[:alert] = @post.errors.full_messages.join(", ")
      render :new
    end
  end

  def index
    if params[:keyword].present?
      @posts = Post.where("title like ?", "%#{params[:keyword]}%")
    else
      @posts = Post.all
    end

    case params[:sort]
      when 'newest'
        @posts = @posts.order(created_at: :desc)
      when 'oldest'
        @posts = @posts.order(created_at: :asc)
      when 'most_comments'
        @posts = @posts.left_joins(:comments).group(:id).order('COUNT(comments.id) DESC')
    end

    @posts = @posts.page(params[:page]).per(12)
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
      flash[:notice] = "投稿が更新されました。"
      redirect_to post_path(@post.id)
    else
      flash[:alert] = @post.errors.full_messages.join(", ")
      render edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "投稿が削除されました。"
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :address, :user_id, :post_image)
  end

  def post_guest_user
    @user = current_user
    if @user.email == "guest@example.com"
      redirect_to user_path(current_user), alert: "ゲストユーザーは新規投稿できません。"
    end
  end

  def ensure_post
    @post = Post.find(params[:id])
    if @post.user_id != current_user.id
      redirect_to posts_path, alert: "他のユーザーの投稿は編集できません。"
    end
  end
end
