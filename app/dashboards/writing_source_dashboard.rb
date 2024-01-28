require "administrate/base_dashboard"

class WritingSourceDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    source: Field::BelongsTo,
    writing: Field::BelongsTo,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    source
    writing
    created_at
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    id
    source
    writing
    created_at
    updated_at
  ].freeze

  FORM_ATTRIBUTES = %i[
    source
    writing
  ].freeze

  COLLECTION_FILTERS = {}.freeze
end
