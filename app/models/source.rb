class Source < ApplicationRecord
  belongs_to :artist
  has_rich_text :description
  validates :name, presence: true, uniqueness: {scope: :artist_id}
end
