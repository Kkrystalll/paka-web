# frozen_string_literal: true

class CompaniesController < ApplicationController
  before_action :set_company_info, :user_params, :company_params, only: :create

  def new
    @company = Company.new
  end

  def create
    @company = Company.create!(gui_number: company_params[:gui_number], name: @res_body['Company_Name'], principal: @res_body['Responsible_Name'], address: @res_body['Company_Location'])

    user = User.create_with(user_params).find_or_create_by(email: user_params[:email])
    company_user = CompanyUser.new(company_id: @company.id, user_id: user.id, role: 1)
    if company_user.save
      redirect_to users_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def company_params
    params.require(:company).permit(:gui_number)
  end

  def set_company_info
    @res_body = GcisService.call(company_params[:gui_number])
    raise ActiveRecord::RecordNotFound if @res_body.empty?
  end
end
