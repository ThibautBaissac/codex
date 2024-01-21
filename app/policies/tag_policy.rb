# frozen_string_literal: true

class TagPolicy < ApplicationPolicy
  def create?
    user.present? && (user.role_admin? || user.role_super_admin?)
  end

  def destroy?
    user.present? && (user.role_admin? || user.role_super_admin?)
  end
end
