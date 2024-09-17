class Admin::SpotsController < ApplicationController

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
  end 
  
  def destroy
  end 
  
  private
  
  def spot_params
    params.require(:spot).permit(:name, :summary, :address, :longitude, :latitude, :spot_image)
  end 
end
