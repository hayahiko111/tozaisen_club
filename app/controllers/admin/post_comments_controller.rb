class Admin::PostCommentsController < ApplicationController
  before_action :authenticate_admin!
  def destroy
    post = PostComment.find(params[:post_id])
    post.destroy
    redirect_to admin_post_path(params[:id])
  end
end