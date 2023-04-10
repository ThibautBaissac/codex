class Mouvement < ApplicationRecord
  belongs_to :work
  has_many :mouvement_quotes
  has_many :quotes, through: :mouvement_quotes

  validates :title, :number, presence: true
end
