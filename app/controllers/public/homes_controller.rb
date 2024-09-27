class Public::HomesController < ApplicationController
  def top
    @top_posts = Post.order("RANDOM()").limit(3)
    @top_spots = Spot.order("RANDOM()").limit(10)
  end

  def about
  end
end
