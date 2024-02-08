class Source < ApplicationRecord
  include Decorable

  belongs_to :artist
  has_rich_text :description
  has_many :source_images, dependent: :destroy
  accepts_nested_attributes_for :source_images, allow_destroy: true

  validates :name, presence: true, uniqueness: {scope: :artist_id}

  validate :start_date_cannot_be_greater_than_end_date

  def start_date_cannot_be_greater_than_end_date
    return unless start_date > end_date

    errors.add(:start_date, "can't be greater than end date")
  end
end
