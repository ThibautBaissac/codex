# frozen_string_literal: true

class StatisticPolicy < ApplicationPolicy
  def index?
    user.present?
  end
end
