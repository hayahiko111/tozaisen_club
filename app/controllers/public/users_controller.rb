class Public::UsersController < ApplicationController
  def show
    @user = current_user
    @my_posts = Post.where(user_id: current_user.id).order(id: "DESC")
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to users_current_user_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
