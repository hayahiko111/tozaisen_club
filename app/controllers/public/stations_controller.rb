class Public::StationsController < ApplicationController
  def index
    @stations = Station.all
  end

  def show
    @posts = Post.where(station_id: params[:id]).order(id: "DESC")
    @station = Station.find(params[:id])
  end
end