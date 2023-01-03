# frozen_string_literal: true

class CompanyUser < ApplicationRecord
  belongs_to :company
  belongs_to :user

  # enum
  enum :role, { user: 0, admin: 1 }, default: :user
end
