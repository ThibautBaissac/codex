# frozen_string_literal: true

class WritingPolicy < ApplicationPolicy
  def edit?
    user.present?
  end

  def update?
    edit?
  end
end
