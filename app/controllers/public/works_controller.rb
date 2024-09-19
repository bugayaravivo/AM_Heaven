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
    @spots = @work.spots
    @reviews = @work.reviews
  end
  
  private
  
  def work_params
    params.require(:work).permit(:title, :genre, :summary, :work_image, :title_)
  end 
end
