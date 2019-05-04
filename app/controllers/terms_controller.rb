class TermsController < ApplicationController
  before_action :authenticate_request!, only: [:create, :index, :destroy]

  def create
    user = @current_user
    if user.terms.create(category: term_params["category"], keyword: term_params["keyword"])
      render json: {message: "Term Created"}
    else
      render json: {message: "Term Not Created"}, status: 422
    end
  end

  def show
  end

  private

  def term_params
    params.permit(:category, :keyword)
  end
end
