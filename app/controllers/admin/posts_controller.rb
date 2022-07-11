class Admin::PostsController < ApplicationController
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
