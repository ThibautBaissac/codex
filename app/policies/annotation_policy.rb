# frozen_string_literal: true

class AnnotationPolicy < ApplicationPolicy
  def create?
    user.present?
  end
end
