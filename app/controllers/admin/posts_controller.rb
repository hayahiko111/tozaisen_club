class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  def show
    @post = Post.find(params[:id])
    @stations = Station.all
    @genres = Genre.all
  end

  def destroy
    @post = Post.find(parms[:post_id])
    @post.destroy
    redirect_to admin_post_path(post.id)
  end
end
