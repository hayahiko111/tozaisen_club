class Admin::WordSearchsController < ApplicationController
  before_action :authenticate_admin!
  def word_search
    if params[:keyword] == ""
      @keyword = params[:keyword]
      redirect_back fallback_location: admin_populars_popular_path, notice: "※入力がありません"
    else
      @posts = Post.word_search(params[:keyword])
      @keyword = params[:keyword]
      @stations = Station.all
      @genres = Genre.all
      @station = Station.new
    end
  end
end
