class Public::StationsController < ApplicationController
  def show
    @posts = Post.where(station_id: params[:id]).order(id: "DESC")
    @station = Station.find(params[:id])
    @stations = Station.all
    @genres = Genre.all
  end
end