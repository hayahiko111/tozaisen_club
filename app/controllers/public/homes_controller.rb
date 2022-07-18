class Public::HomesController < ApplicationController
  before_action :authenticate_user!, except: [:top]
  def top
  end

  def popular
    @favorite_top4 = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(4).pluck(:post_id))
    @stations = Station.all
    @genres = Genre.all
  end

  def word_search
    if params[:keyword] == ""
      @keyword = params[:keyword]
      redirect_back fallback_location: root_path, notice: "※入力がありません"
    else
      @posts = Post.word_search(params[:keyword]).page(params[:page])
      @keyword = params[:keyword]
      @stations = Station.all
      @genres = Genre.all
    end
  end
end