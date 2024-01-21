# frozen_string_literal: true

class WritingPolicy < ApplicationPolicy
  def new?
    user.present? && (user.role_admin? || user.role_super_admin?)
  end

  def create?
    new?
  end

  def edit?
    user.present? && (user.role_admin? || user.role_super_admin?)
  end

  def update?
    edit?
  end
end
