class NavPresenter
  include Rails.application.routes.url_helpers

  def initialize(user:)
    @user = user
  end

  def items
    menu_items = []
    Artist.all.order(:created_at).each do |artist|
      menu_items << [artist_path(artist), artist.decorate.fullname]
    end
    if @user.present?
      menu_items << [artist_writings_path(Artist.first), Writing.model_name.human(count: 2)]
      menu_items << [sources_path, Source.model_name.human(count: 2)]
      menu_items << [administration_annotations_path, "Notes"]
      menu_items << [statistics_path, I18n.t("statistics.statistics")]
    end
    menu_items << [admin_root_path, "Administrate"] if @user&.role_super_admin?
    menu_items
  end
end
