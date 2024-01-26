class Tagging < ApplicationRecord
  belongs_to :tag
  belongs_to :taggable, polymorphic: true
  belongs_to :writing, -> { where taggings: { taggable_type: 'Writing' } }, foreign_key: :taggable_id, optional: true
end
