# frozen_string_literal: true

class ArtistPolicy < ApplicationPolicy
  def index?
    user.present?
  end

  def show?
    user.present?
  end

  def edit?
    (user&.role_admin? && record.in?(user&.artists)) || user&.role_super_admin?
  end

  def update?
    edit?
  end
end
