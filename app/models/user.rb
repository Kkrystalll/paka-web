# frozen_string_literal: true

class User < ApplicationRecord
  authenticates_with_sorcery!

  # validation
  validates :email, uniqueness: true
  validates :password, confirmation: true, length: { minimum: 6 }, if: -> { new_record? || changes[:crypted_password] }
  validates :name, :email, presence: true

  # enum
  enum :role, { user: 0, admin: 1 }, default: :user
end
