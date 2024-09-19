class Admin::SpotsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @spots = Spot.all
    @spot = Spot.new
  end
  
  def create
    @spot = Spot.new(spot_params)
    if @spot.save
      redirect_to admin_spots_path
    else
      render index
    end 
  end 

  def show
    @spot = Spot.find(params[:id])
  end

  def edit
    @spot = Spot.find(params[:id])
  end
  
  def update
    @spot = Spot.find(params[:id])
    if @spot.update(spot_params)
      redirect_to admin_spot_path(@spot.id)
    else
      render edit
    end 
  end 
  
  def destroy
    spot = Spot.find(params[:id])
    spot.destroy
    redirect_to admin_spots_path
  end 
  
  private
  
  def spot_params
    params.require(:spot).permit(:name, :summary, :address, :longitude, :latitude, :spot_image, :work_id)
  end 
end
