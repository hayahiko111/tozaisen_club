class Admin::PopularsController < ApplicationController
  def popular
    @favorite_top4 = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
    @stations = Station.all
    @genres = Genre.all
  end
end
