class MouvementElement < ApplicationRecord
  belongs_to :mouvement
  belongs_to :element

  validates :mouvement, :element, presence: true
end
