class WorkElement < ApplicationRecord
  belongs_to :work
  belongs_to :element

  validates :work, :element, presence: true
end
