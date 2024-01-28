require "administrate/base_dashboard"

class ArtistEditorDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    artist: Field::BelongsTo,
    user: Field::BelongsTo,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    artist
    user
    created_at
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    id
    artist
    user
    created_at
    updated_at
  ].freeze

  FORM_ATTRIBUTES = %i[
    artist
    user
  ].freeze

  COLLECTION_FILTERS = {}.freeze
end
