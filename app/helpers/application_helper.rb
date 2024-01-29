module ApplicationHelper
  include Pagy::Frontend

  def render_in_modal(url: nil, policy: false, &block)
    return unless policy

    link_to(url, data: {controller: :turbo}, &block)
  end

  def image_exists?(image_path)
    Rails.application.assets.find_asset(image_path).present? || File.exist?(Rails.root.join("public", image_path))
  end

  def safe_image_tag(image_path, **options)
    return unless image_exists?(image_path)

    image_tag(image_path, **options)
  end
end
