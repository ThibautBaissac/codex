class Element < ApplicationRecord
  # has_rich_text :description
  has_one_attached :extract

  has_many :mouvement_elements, dependent: :destroy
  has_many :mouvements, through: :mouvement_elements
  has_many :work_elements, dependent: :destroy
  has_many :works, through: :work_elements

  validates :description, :title, presence: true
  validates :extract_size, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 100 }

  string_enum category: Constants::Element::CATEGORIES

  scope :with_category, ->(category) { where("? = ANY (category)", category) }

  def with_motif?
    category.include?("MOTIF")
  end
end
