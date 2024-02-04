class SourceImage < ApplicationRecord
  belongs_to :source
  has_one_attached :file
  has_rich_text :description
  validates :is_cover, uniqueness: {scope: :source_id}, if: :is_cover?
end
