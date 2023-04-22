class Element < ApplicationRecord
  has_many :mouvement_elements, dependent: :destroy
  has_many :mouvements, through: :mouvement_elements

  validates :description, :title, :category, presence: true

  string_enum category: Constants::Element::CATEGORIES

  scope :with_category, ->(category) { where("? = ANY (category)", category) }
end
