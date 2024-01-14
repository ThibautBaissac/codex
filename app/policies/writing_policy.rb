# frozen_string_literal: true

class WritingPolicy < ApplicationPolicy
  def new?
    user.present?
  end

  def create?
    new?
  end

  def edit?
    user.present?
  end

  def update?
    edit?
  end
end
