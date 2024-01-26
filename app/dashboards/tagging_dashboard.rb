require "administrate/base_dashboard"

class TaggingDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    tag: Field::BelongsTo,
    taggable: Field::Polymorphic,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    tag
    taggable
    created_at
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    id
    tag
    taggable
    created_at
    updated_at
  ].freeze

  FORM_ATTRIBUTES = %i[
    tag
    taggable
  ].freeze

  COLLECTION_FILTERS = {}.freeze
end
