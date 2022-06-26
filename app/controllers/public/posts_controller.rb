class Public::PostsController < ApplicationController
  def new
    @post = Post.new
    @genres = Genre.all
    @stations = Station.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to station_path(@post.station_id)
    else
      redirect_to new_post_path
    end
  end

  def edit
    @post = Post.find(params[:id])
    @genres = Genre.all
    @stations = Station.all
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to users_current_user_path
    else
      redirect_to edit_post_path(@post.id)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to users_current_user_path
  end

  private
  def post_params
    params.require(:post).permit(:user_id, :image, :genre_id, :station_id, :message)
  end
end