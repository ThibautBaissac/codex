class Mouvement < ApplicationRecord
  belongs_to :work
  has_many :mouvement_elements
  has_many :elements, through: :mouvement_elements

  validates :title, :number, presence: true
end
