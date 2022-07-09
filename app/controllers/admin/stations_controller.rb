class Admin::StationsController < ApplicationController
  def index
    @station = Station.new
    @stations = Station.all
  end

  def show
    @station = Station.find(params[:id])
    @posts = Post.where(station_id: params[:id]).order(id: "DESC")
  end

  def create
    @station = Station.new(station_params)
    @station.save
    redirect_to admin_stations_path
  end

  def edit
    @station = Station.find(params[:id])
  end

  def update
    @station = Station.find(params[:id])
    @station.update(station_params)
    redirect_to admin_stations_path
  end

  private
  def station_params
    params.require(:station).permit(:name)
  end
end