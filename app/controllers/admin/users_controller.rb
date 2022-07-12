class Admin::UsersController < ApplicationController
  def index
    @users = User.all
    @stations = Station.all
    @genres = Genre.all
  end

  def show
    @user = User.find(params[:id])
    @stations = Station.all
    @genres = Genre.all
  end

  def edit
    @user = User.find(params[:id])
    @stations = Station.all
    @genres = Genre.all
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admin_user_path(@user.id)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :is_deleted)
  end
end