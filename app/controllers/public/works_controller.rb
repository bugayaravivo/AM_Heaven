class Public::WorksController < ApplicationController
  before_action :authenticate_user!
  
  def index
    if params[:letter]
      @works = Work.by_first_letter(params[:letter])
    else
      @works = Work.all
    end 
  end

  def show
    @work = Work.find(params[:id])
    @average_rating = @work.average_rating
    @spots = @work.spots
    @reviews = @work.reviews.where('user_id = ? OR score > ?', current_user.id, -0.5).page(params[:page]).per(10) 
  end
  
  private
  
  def work_params
    params.require(:work).permit(:title, :genre, :summary, :work_image, :title_)
  end 
end
