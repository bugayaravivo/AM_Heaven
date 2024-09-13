class Public::SpotsController < ApplicationController
  def index
    @spots = Spot.all
  end

  def show
    @spot = Spot.find(params[:id])
  end
  
  private
  
  def spot_params
    params.require(:spot).permit(:work_id, :name, :summary, :address, :longitude, :latitude, :sopt_image)
  end 
end
