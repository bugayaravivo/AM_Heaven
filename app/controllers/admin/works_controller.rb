class Admin::WorksController < ApplicationController
  before_action :authenticate_admin!

  def index
    @work = Work.new
    @works = Work.page(params[:page]).per(4)
  end
  
  def create
    @work = Work.new(work_params)
    if @work.save
      redirect_to admin_works_path
    else
      @works = Work.page(params[:page]).per(4)
      render :index
    end 
  end 

  def show
    @work = Work.find(params[:id])
  end

  def edit
    @work = Work.find(params[:id])
  end
  
  def update
    @work = Work.find(params[:id])
    if @work.update(work_params)
      redirect_to admin_work_path(@work.id)
    else
      render :edit
    end 
  end 
  
  def destroy
    work = Work.find(params[:id])
    work.destroy
    redirect_to admin_works_path
  end 
  
  
  def work_params
    params.require(:work).permit(:title, :genre, :summary, :work_image, :title_yomi)
  end 
end
