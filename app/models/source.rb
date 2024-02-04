class Source < ApplicationRecord
  belongs_to :artist
  has_rich_text :description
  has_many :source_images, dependent: :destroy
  accepts_nested_attributes_for :source_images, allow_destroy: true

  validates :name, presence: true, uniqueness: {scope: :artist_id}

  def cover_image
    source_images.find_by(is_cover: true).try(:file)
  end
end
