class Public::SearchesController < ApplicationController
  before_action :authenticate_user!
   
  def search
    @users = User.all
    @word = params[:word]
    if params[:word].present?
      @users = User.where("name like ?", "%#{params[:word]}%")
    end 
  end 
end
