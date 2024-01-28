# frozen_string_literal: true

class WritingPolicy < ApplicationPolicy
  def new?
    (user&.role_admin? && record.in?(user&.artists)) || user&.role_super_admin?
  end

  def create?
    new?
  end

  def edit?
    (user&.role_admin? && record.artist.in?(user&.artists)) || user&.role_super_admin?
  end

  def update?
    edit?
  end
end
