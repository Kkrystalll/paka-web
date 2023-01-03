# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :company_users, dependent: :destroy
  has_many :users, through: :company_users

  # validation
  validates :gui_number, uniqueness: true, taiwan_format: true
  validates :name, :gui_number, presence: true
end
