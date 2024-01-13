# frozen_string_literal: true

class CircleIconComponent < ViewComponent::Base
  def initialize(icon:, size: "text-xs")
    @icon = icon
    @size = size
  end
end
