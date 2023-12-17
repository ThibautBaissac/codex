class Tag < ApplicationRecord
  has_many :taggings
  has_many :taggable, through: :taggings
  belongs_to :writings, optional: true

  normalizes :name, with: ->(name) { name.downcase.strip }
end
