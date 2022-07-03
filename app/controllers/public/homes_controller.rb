class Public::HomesController < ApplicationController
  def top
  end

  def popular
    @favorite_top4 = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
    @stations = Station.all
  end
end