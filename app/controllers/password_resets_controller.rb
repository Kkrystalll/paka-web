# frozen_string_literal: true

class PasswordResetsController < ApplicationController
  before_action :token, :reset_password_user, except: %i[new create]

  def new; end

  def edit; end

  def create
    @user = User.find_by(email: params[:email])
    @user&.deliver_reset_password_instructions!

    redirect_to root_path
  end

  def update
    return if @user.blank?

    @user.password_confirmation = user_reset_password_params[:password_confirmation]

    if @user.change_password(user_reset_password_params[:password])
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def token
    @token = params[:id]
  end

  def reset_password_user
    @user = User.load_from_reset_password_token(params[:id])
  end

  def user_reset_password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
