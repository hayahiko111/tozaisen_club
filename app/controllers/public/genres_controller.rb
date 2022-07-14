class Public::GenresController < ApplicationController
  before_action :authenticate_user!
  def show
    @stations = Station.all
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    @posts = Post.where(genre_id: params[:id]).order("id DESC").page(params[:page])
    if Post.where(genre_id: params[:id]).empty?
      flash.now[:notice] = "まだ投稿がありません"
      render :show
    end
  end
end