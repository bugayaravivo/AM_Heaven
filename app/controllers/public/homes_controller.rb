class Public::HomesController < ApplicationController
  def top
    if ActiveRecord::Base.connection_config[:adapter] == "sqlite3"
      @top_posts = Post.order("RANDOM()").limit(3)
      @top_spots = Spot.order("RANDOM()").limit(10)
    else
      @top_posts = Post.order("RAND()").limit(3)
      @top_spots = Spot.order("RAND()").limit(10)
    end 
  end

  def about
  end
end
