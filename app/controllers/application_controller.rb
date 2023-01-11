# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :current_company

  private

  def require_login
    return if logged_in? || current_company

    redirect_to session_path
  end

  def current_company
    @current_company ||= Company.find_by(gui_number: session[:gui])
  end

  def membership_check
    return if member?

    logout
    session.delete(:gui)
    redirect_to session_path
  end

  def member?
    CompanyUser.exists?(company: current_company, user: current_user)
  end
end
