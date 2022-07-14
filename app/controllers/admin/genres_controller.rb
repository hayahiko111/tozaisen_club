class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
  def index
    @genre = Genre.new
    @genres = Genre.all
    @stations = Station.all
  end

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

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to admin_genres_path
  end

  def edit
    @genre = Genre.find(params[:id])
    @stations = Station.all
    @genres = Genre.all
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to admin_genres_path(@genre.id)
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
