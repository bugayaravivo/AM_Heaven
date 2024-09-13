class Admin::WorksController < ApplicationController

  def index
    @work = Work.new
    @works = Work.all
  end
  
  def create
    @work = Work.new(work_params)
    if @work.save
      redirect_to admin_works_path
    else
      render index
    end 
  end 

  def show
    @work = Work.find(params[:id])
  end

  def edit
    @work = Work.find(params[:id])
  end
  
  def work_params
    params.require(:work).permit(:title, :genre, :summary, :work_image)
  end 
end
