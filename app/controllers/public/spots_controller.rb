class Public::SpotsController < ApplicationController
  before_action :authenticate_user!

  
  def index
    @spots = Spot.all
  
  # キーワード検索
    if params[:search].present?
      @spots = @spots.where('name LIKE ?', "%#{params[:search]}%")
    end 

  # 都道府県フィルタ
    if params[:area].present?
      @spots = @spots.where('address LIKE ?', "%#{params[:area]}%")
    end 
  end
  
  def show
    @spot = Spot.find(params[:id])
    @average_rating = @spot.average_rating
    @reviews = @spot.reviews
  end
  
  private
  
  def spot_params
    params.require(:spot).permit(:work_id, :name, :summary, :address, :longitude, :latitude, :sopt_image)
  end 
end
