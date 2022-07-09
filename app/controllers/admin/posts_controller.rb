class Admin::PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(parms[:post_id])
    @post.destroy
    redirect_to admin_post_path(post.id)
  end
end
