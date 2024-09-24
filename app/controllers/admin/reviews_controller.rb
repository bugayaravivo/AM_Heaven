class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
  end

  def show
  end
  
  def destroy
  end 
  
  private
  
  def review_params
    params.require(:review).permit(:title, :body, :rating, :work_id, :spot_id)
  end 
end
