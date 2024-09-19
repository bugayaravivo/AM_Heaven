class Public::ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:new,:edit]
  
  def new
    @review = Review.new
  end
  
  def create
    @review = Review.new(review_params)
    if @review.save
      if @review.work_id.present?
        redirect_to work_path(@review.work_id), notice: "レビューの投稿に成功しました"
      elsif @review.spot_id.present?
        redirect_to spot_path(@review.spot_id), notice: "レビューの投稿に成功しました"
      else
        redirect_to root_path, alert: 'レビューの投稿に成功しましたが、作品も聖地にも関連づけられていません'
      end 
    else
      render :new
    end 
  end 

  def index
  end

  def show
  end

  def edit
  end
  
  def update
  end 
  
  def destroy
  end 
  
  private
  
  def review_params
    params.require(:review).permit(:title, :body, :rating, :work_id, :spot_id)
  end 
  
  def review_guest_user
    @user = User.find(params[:id])
    if @user.email == "guest@example.com"
      redirect_to user_path(current_user), notice: "ゲストユーザーなので遷都できません。"
    end
  end  
end
