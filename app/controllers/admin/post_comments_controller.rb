class Admin::PostCommentsController < ApplicationController
  def destroy
    post = PostComment.find(params[:post_id])
    post.destroy
    redirect_to admin_post_path(params[:id])
  end
end