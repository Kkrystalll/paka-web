# frozen_string_literal: true

module Admin
  class BackendPolicy < ApplicationPolicy
    def admin?
      admin
    end

    class Scope < Scope
      # NOTE: Be explicit about which records you allow access to!
      # def resolve
      #   scope.all
      # end
    end
  end
end
