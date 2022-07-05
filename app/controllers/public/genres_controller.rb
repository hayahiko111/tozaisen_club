class Public::GenresController < ApplicationController
  def show
    @stations = Station.all
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    @posts = Post.where(genre_id: params[:id]).order("id DESC")
    if Post.where(genre_id: params[:id]).empty?
      flash.now[:notice] = "まだ投稿がありません"
      render :show
    end
  end
end