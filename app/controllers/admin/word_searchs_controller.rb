class Admin::WordSearchsController < ApplicationController
  def word_search
    if params[:keyword] == ""
      @keyword = params[:keyword]
      redirect_back fallback_location: root_path, notice: "※入力がありません"
    else
      @posts = Post.word_search(params[:keyword])
      @keyword = params[:keyword]
      @stations = Station.all
      @genres = Genre.all
    end
  end
end
