class TermsController < ApplicationController
  before_action :authenticate_request!, only: [:create, :index, :destroy]

  def create
    term = @current_user.terms.create(term_params)
    if term.save
      render json: {message: "Term Created"}
    else
      render json: {message: "Term Not Created"}, status: 422
    end
  end

  def index
    user = @current_user
    render json: user.terms
  end

  def destroy
    term = Term.find(params[:id])
    if term.destroy
      render json: {message: "Term Deleted"}
    else
      render json: {message: "Term Not Deleted"}, status: 422
    end
  end

  private

  def term_params
    params.permit(:category, :keyword)
  end
end
