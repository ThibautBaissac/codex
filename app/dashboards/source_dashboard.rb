require "administrate/base_dashboard"

class SourceDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    artist: Field::BelongsTo,
    name: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    artist
    name
    created_at
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    id
    artist
    name
    created_at
    updated_at
  ].freeze

  FORM_ATTRIBUTES = %i[
    artist
    name
  ].freeze

  COLLECTION_FILTERS = {}.freeze
end
