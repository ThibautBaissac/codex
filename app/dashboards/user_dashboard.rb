require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    # annotations: Field::Text,
    email: Field::String,
    firstname: Field::String,
    lastname: Field::String,
    password_digest: Field::String,
    role: Field::Select.with_options(searchable: false, collection: lambda { |field|
                                                                      field.resource.class.send(field.attribute.to_s.pluralize).keys
                                                                    }),
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    email
    firstname
    lastname
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    id
    email
    firstname
    lastname
    role
    password_digest
    created_at
    updated_at
  ].freeze

  FORM_ATTRIBUTES = %i[
    email
    firstname
    lastname
    role
    password_digest
  ].freeze

  COLLECTION_FILTERS = {}.freeze

  def display_resource(user)
    user.email
  end
end
