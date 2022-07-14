class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_normal_user, only: %i[edit update withdraw]

  def ensure_normal_user
    @user = current_user
    if @user.email == 'guest@example.com'
      redirect_to users_current_user_path, notice: "ゲストユーザーの更新・退会は出来ません"
    end
  end

  def show
    @user = current_user
    @my_posts = Post.where(user_id: current_user.id).order(id: "DESC").page(params[:page])
    @stations = Station.all
    @genres = Genre.all
  end

  def edit
    @user = current_user
    @stations = Station.all
    @genres = Genre.all
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to users_current_user_path
  end

  def withdraw
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
