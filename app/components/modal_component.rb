# frozen_string_literal: true

class ModalComponent < ViewComponent::Base
  def initialize(title: nil)
    @title = title
  end
end
