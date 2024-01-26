require "administrate/base_dashboard"

class AnnotationDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    annotatable: Field::Polymorphic,
    content: Field::Text,
    rich_text_content: Field::Text,
    user: Field::BelongsTo,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    user
    annotatable
    content
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    id
    user
    annotatable
    content
    rich_text_content
    created_at
    updated_at
  ].freeze

  FORM_ATTRIBUTES = %i[
    annotatable
    user
    content
    rich_text_content
  ].freeze

  COLLECTION_FILTERS = {}.freeze
end
