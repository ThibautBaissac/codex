module ApplicationHelper
  include Pagy::Frontend

  def render_in_modal(url: nil, policy: false)
    return unless policy
    link_to(url, data: {controller: :turbo} ) do
      yield
    end
  end
end
