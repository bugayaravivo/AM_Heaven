class Public::HomesController < ApplicationController
  def top
    @top_posts = Post.order("RAND()").limit(3)
    @top_spots = Spot.order("RAND()").limit(10)
  end

  def about
  end
end
