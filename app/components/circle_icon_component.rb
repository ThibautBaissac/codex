# frozen_string_literal: true

class CircleIconComponent < ViewComponent::Base
  def initialize(icon:, size: "text-xs", bg_color: "bg-sky-700")
    @icon = icon
    @size = size
    @bg_color = bg_color
  end
end
