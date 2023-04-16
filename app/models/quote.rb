class Quote < ApplicationRecord
  has_many :mouvement_quotes, dependent: :destroy
  has_many :mouvements, through: :mouvement_quotes

  validates :description, :title, :category, presence: true

  string_enum category: Constants::Quote::CATEGORIES

  scope :with_category, ->(category) { where("? = ANY (category)", category) }
end
