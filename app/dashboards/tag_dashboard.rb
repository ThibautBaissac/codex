require "administrate/base_dashboard"

class TagDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::String,
    taggings: Field::HasMany,
    writings: Field::HasMany,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    name
    taggings
    writings
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    id
    name
    taggings
    writings
    created_at
    updated_at
  ].freeze

  FORM_ATTRIBUTES = %i[
    name
    taggings
    writings
  ].freeze

  COLLECTION_FILTERS = {}.freeze

  def display_resource(tag)
    tag.id
  end
end
