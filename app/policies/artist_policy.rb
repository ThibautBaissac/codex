# frozen_string_literal: true

class ArtistPolicy < ApplicationPolicy
  def index?
    user.present?
  end

  def show?
    user.present?
  end

  def edit?
    user.present? && (user.role_admin? || user.role_super_admin?)
  end

  def update?
    edit?
  end
end
