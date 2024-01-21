# frozen_string_literal: true

class AnnotationPolicy < ApplicationPolicy
  def index?
    user.present?
  end

  def create?
    user.present? && (user.role_admin? || user.role_super_admin?)
  end

  def new?
    user.present? && (user.role_admin? || user.role_super_admin?)
  end

  def edit?
    user.present? && (user.role_admin? || user.role_super_admin?)
  end

  def update?
    user.present? && (user.role_admin? || user.role_super_admin?)
  end
end
