# frozen_string_literal: true

class ArtistPolicy < ApplicationPolicy
  def edit?
    user.present?
  end

  def update?
    edit?
  end
end
