# frozen_string_literal: true

class WritingPolicy < ApplicationPolicy
  def update?
    user.present?
  end
end
