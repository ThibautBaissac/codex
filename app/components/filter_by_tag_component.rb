# frozen_string_literal: true

class FilterByTagComponent < ViewComponent::Base
  def initialize(tag:, param:)
    @tag = tag
    @param = param
  end
end
