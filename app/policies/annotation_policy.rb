# frozen_string_literal: true

class AnnotationPolicy < ApplicationPolicy
  def index?
    user.present?
  end

  def new?
    user&.role_admin? || user&.role_super_admin?
  end

  def create?
    user&.role_admin? || user&.role_super_admin?
  end

  def edit?
    user&.role_admin? || user&.role_super_admin?
  end

  def update?
    user&.role_admin? || user&.role_super_admin?
  end
end
