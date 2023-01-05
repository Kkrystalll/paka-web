# frozen_string_literal: true

class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :company_users, dependent: :destroy
  has_many :companies, through: :company_users

  # validation
  validates :email, uniqueness: true, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, confirmation: true, length: { minimum: 4 }, if: -> { new_record? || changes[:crypted_password] }
  validates :name, presence: true
end
