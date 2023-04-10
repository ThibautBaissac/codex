class Work < ApplicationRecord
  has_many :mouvements
  string_enum instrumentation: Constants::Instrumentation::LIST

  validates :title, presence: true
end
