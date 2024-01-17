# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def show?
    user.present?
  end

  def edit?
    user.present?
  end

  def update?
    edit?
  end
end
