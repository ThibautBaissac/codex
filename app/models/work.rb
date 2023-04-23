class Work < ApplicationRecord
  has_many :mouvements
  has_many :work_elements
  has_many :elements, through: :work_elements

  string_enum instrumentation: Constants::Instrumentation::LIST

  validates :title, presence: true
end
