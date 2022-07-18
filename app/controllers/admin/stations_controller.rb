class Admin::StationsController < ApplicationController
  before_action :authenticate_admin!
  def show
    @station = Station.new
    @station_show = Station.find(params[:id])
    @posts = Post.where(station_id: params[:id]).order(id: "DESC")
    @stations = Station.all
    @genres = Genre.all
  end

  def create
    @station = Station.new(station_params)
    @station.save
    @stations = Station.all
    @genres = Genre.all
    redirect_back fallback_location: admin_populars_popular_path
  end

  def edit
    @station = Station.new
    @station_show = Station.find(params[:id])
    @stations = Station.all
    @genres = Genre.all
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