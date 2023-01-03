# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :company_users
  has_many :users, through: :company_users

  # validation
  validates :gui_number, uniqueness: true
  validates :name, :email, :gui_number, presence: true
  validates :password, confirmation: true, length: { minimum: 6 }
end
