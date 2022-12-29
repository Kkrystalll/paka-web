# frozen_string_literal: true

module Admin
  class BaseController < ApplicationController
    before_action :admin_policy

    rescue_from Pundit::NotAuthorizedError, with: :not_authorized

    private

    def not_authorized
      session[:return_to_url] = request.url
      redirect_to admin_session_path
    end

    def admin_policy
      authorize %i[admin backend], :admin?
    end
  end
end
