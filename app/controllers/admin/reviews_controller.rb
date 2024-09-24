class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @works = Work.all
    @spots = Spot.all
    @reviews = Review.all
    
    if params[:keyword].present?
      @reviews = @reviews.where("title like ? or body like ?", "%#{params[:keyword]}%", "%#{params[:keyword]}%")
    end 
    
    if params[:work_id].present?
      @reviews = @reviews.where(work_id: params[:work_id])
    end 
    
    if params[:spot_id].present?
      @reviews = @reviews.where(spot_id: params[:spot_id])
    end 
    
    @reviews = @reviews.page(params[:page]).per(10)
  end

  def show
    @review = Review.find(params[:id])
  end
  
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to admin_reviews_path
  end 
  
  private
  
  def review_params
    params.require(:review).permit(:title, :body, :rating, :work_id, :spot_id)
  end 
end
