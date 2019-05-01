class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      response = {message: "Account Created"}
      render json: response
    else
      render json: {message: "Account Not Created"}, status: 422
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      response = {message: "Account Updated"}
      render json: response
    else
      render json: {message: "Account Not Updated"}, status: 422
    end
  end

  private

  def user_params
    params.permit(:username, :password, :email)
  end
end
