class Public::WorksController < ApplicationController
  def index
    @works = Work.all
  end

  def show
    @work = Work.find(params[:id])
  end
  
  private
  
  def work_params
    params.require(:work).permit(:title, :genre, :summary, :work_image)
  end 
end
