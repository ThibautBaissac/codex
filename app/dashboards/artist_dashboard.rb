require "administrate/base_dashboard"

class ArtistDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    birthdate: Field::Date,
    deathdate: Field::Date,
    firstname: Field::String,
    lastname: Field::String,
    rich_text_bio: Field::Text,
    writings: Field::HasMany,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    firstname
    lastname
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    id
    firstname
    lastname
    birthdate
    deathdate
    rich_text_bio
    writings
    created_at
    updated_at
  ].freeze

  FORM_ATTRIBUTES = %i[
    firstname
    lastname
    birthdate
    deathdate
    rich_text_bio
    writings
  ].freeze

  COLLECTION_FILTERS = {}.freeze

  def display_resource(artist)
    artist&.lastname || artist&.firstname || artist&.id
  end
end
