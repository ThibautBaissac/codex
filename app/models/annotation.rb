class Annotation < ApplicationRecord
  belongs_to :user
  belongs_to :annotatable, polymorphic: true

  has_rich_text :content
end
