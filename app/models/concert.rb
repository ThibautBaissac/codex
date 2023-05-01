class Concert < ApplicationRecord
  validates :date, presence: true
end
