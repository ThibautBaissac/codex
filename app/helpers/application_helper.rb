module ApplicationHelper
  include Pagy::Frontend

  def render_in_modal(url: nil, policy: false, &block)
    return unless policy

    link_to(url, data: {controller: :turbo}, &block)
  end
end
