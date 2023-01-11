# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = login(params[:email], params[:password])
    return unless user && member_of_company?

    session[:gui] = params[:gui_number]
    redirect_back_or_to users_path
  end

  def destroy
    logout
    session.delete(:gui)
    redirect_to session_path
  end

  private

  def member_of_company?
    user = User.find_by(email: params[:email])
    company = Company.find_by(gui_number: params[:gui_number])
    CompanyUser.exists?(company:, user:)
  end
end
