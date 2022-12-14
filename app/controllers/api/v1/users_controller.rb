class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  def index
    users = User.all.order(created_at: :asc)
    render status:200, json: users
  end

  def show
    render status:200, json: @user
  end

  def update
    if @user.update(user_params)
      render status:200, json: {data: @user}
    else
      render status:400, json: {data: @user.errors}
    end
  end

  def destroy
    if @user.destroy
      render status: 200 , json:{data: @user}
  else
      render status: 400 , json:{ data: @user.errors}
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :icon, :uid)
  end
end
