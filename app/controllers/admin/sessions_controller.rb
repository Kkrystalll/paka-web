# frozen_string_literal: true

module Admin
  class SessionsController < ApplicationController
    def new
      session[:return_to_url] ||= params[:next]
    end

    def create
      user = login(params[:email], params[:password])

      if user
        redirect_back_or_to admin_users_path
      else
        render :new
      end
    end

    def destroy
      logout
      redirect_to admin_users_path
    end
  end
end
