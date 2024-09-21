class Public::ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :review_guest_user, only: [:new,:edit]
  
  def new
    @review = Review.new
    
    # 作品か聖地かを判定
    if params[:work_id].present?
      @work = Work.find(params[:work_id])
    elsif params[:spot_id].present?
      @spot = Spot.find(params[:spot_id])
    end 
  end
  
  def create
    @review = Review.new(review_params)
    
    if params[:work_id].present?
      @work = Work.find(params[:work_id])
      @review.work = @work  #レビューを作品に関連付けする
    elsif params[:spot_id].present?
      @spot = Spot.find(params[:spot_id])
      @review.spot = @spot  #レビューを聖地に関連付けする
    end 
    
    @review.user = current_user #レビューを書いたユーザーを関連付ける
      
    if @review.save
      if @review.work_id.present?
       logger.debug("レビュー保存に失敗: #{@review.errors.full_messages}")
        redirect_to work_path(@review.work_id), notice: "レビューの投稿に成功しました"
      elsif @review.spot_id.present?
        redirect_to spot_path(@review.spot_id), notice: "レビューの投稿に成功しました"
      else
        redirect_to root_path, alert: 'レビューの投稿に成功しましたが、作品も聖地にも関連づけられていません'
      end 
    else
      flash.now[:alert] = @review.errors.full_messages.join(", ")
      render :new
    end 
  end 

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
  end
  
  def update
    @review = Review.find(params[:id])
  end 
  
  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      if @review.work_id.present?
        redirect_to work_path(@review.work_id), notice: "レビューを削除しました"
      elsif @review.spot_id.present?
        redirect_to spot_path(@review.spot_id), notice: "レビューを削除しました"
      else
        redirect_to root_path
      end 
    else
      render :new
    end 
  end 
  
  private
  
  def review_params
    params.require(:review).permit(:title, :body, :rating, :work_id, :spot_id)
  end 
  
  def review_guest_user
    @user = current_user
    if @user.email == "guest@example.com"
      redirect_to user_path(current_user), notice: "ゲストユーザーなのでレビューを作成できません。"
    end
  end  
end
