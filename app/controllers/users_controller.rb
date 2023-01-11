# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :require_login, :membership_check

  def index
    @users = User.all
  end
end
