class NavbarPresenter
  include Rails.application.routes.url_helpers

  def initialize(user:, controller_name: nil)
    @user = user
    @controller_name = controller_name
  end

  def items
    menu_items = []
    Artist.all.order(:created_at).each do |artist|
      menu_items << [artist_path(artist), artist.decorate.fullname, current_item?("artists")]
    end
    if @user.present?
      menu_items << [artist_writings_path(Artist.first), Writing.model_name.human(count: 2),
                     current_item?(%w[writings calendar])]
      menu_items << [sources_path, Source.model_name.human(count: 2),
                     current_item?(%w[sources])]
      menu_items << [administration_annotations_path, "Notes",
                     current_item?(%w[annotations])]
      menu_items << [statistics_path, I18n.t("statistics.statistics"),
                     current_item?(%w[statistics])]
    end
    menu_items << [admin_root_path, "Administrate"] if @user&.role_super_admin?
    menu_items
  end

  private

  def current_item?(controller_name)
    @controller_name.in?(controller_name) ? "border-b border-orange-700" : ""
  end
end
