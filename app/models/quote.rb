class Quote < ApplicationRecord
  has_many :mouvement_quotes
  has_many :mouvements, through: :mouvement_quotes

  validates :description, :title, :category, presence: true

  string_enum category: Constants::Quote::CATEGORIES
end
