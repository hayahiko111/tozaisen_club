class Public::StationsController < ApplicationController
  before_action :authenticate_user!
  def show
    @station = Station.find(params[:id])
    @stations = Station.all
    @genres = Genre.all
    @posts = Post.where(station_id: params[:id]).order(id: "DESC").page(params[:page])
    if @posts.empty?
      flash.now[:notice] = "まだ投稿がありません"
    end
  end
end