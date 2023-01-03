# frozen_string_literal: true

class CompaniesController < ApplicationController
  before_action :get_company_info, :user_params, :company_params, only: :create

  def new
    @company = Company.new
  end

  def create
    @company = Company.create!(gui_number: company_params[:gui_number], name: @res_body['Company_Name'], principal: @res_body['Responsible_Name'], address: @res_body['Company_Location'])

    user = @company.users.new(user_params)
    if user.save
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

  def get_company_info
    uri = "https://data.gcis.nat.gov.tw/od/data/api/5F64D864-61CB-4D0D-8AD9-492047CC1EA6?$format=json&$filter=Business_Accounting_NO eq #{company_params[:gui_number]}"
    res = Faraday.get(uri)
    @res_body = JSON.parse(res.body)[0]
    raise ActiveRecord::RecordNotFound if @res_body['Business_Accounting_NO'].nil?
    @res_body
  end
end
