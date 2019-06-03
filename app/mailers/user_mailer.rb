# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def match_email
    @user = params[:user]
    @term = params[:term]
    params[:matches].each do |mat|
      @match = mat
      mail(to: 'acentrelli@gmail.com', subject: 'MechMarket Match')
    end
  end
end
