class UsersController < ApplicationController
  before_action :authenticate_request!, only: [:update, :show]

  def create
    user = User.new(user_params)
    if user.save
      response = {message: "Account Created"}
      render json: response
    else
      render json: {message: "Account Not Created"}, status: 422
    end
  end

  def update
    user = User.find(params[:id])
    if user.update_attributes(user_params)
      response = {message: "Account Updated"}
      render json: response
    else
      render json: {message: "Account Not Updated"}, status: 422
    end
  end

  def show
    render json: @current_user
  end

  def login
    user = User.find_by(email: params[:email].to_s.downcase)
    if user && user.authenticate(params[:password])
      auth_token = JsonWebToken.encode({user_id: user.id})
      render json: {auth_token: auth_token}, status: :ok
    else
      render json: {error: 'Invalid username/password'}, status: :unauthorized
    end
  end

  private

  def user_params
    params.permit(:username, :password, :email)
  end
end
