class Tag < ApplicationRecord
  has_many :taggings
  has_many :writings, through: :taggings

  normalizes :name, with: lambda { |name| name.downcase.strip }
end
