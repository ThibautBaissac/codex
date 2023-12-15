class Artist < ApplicationRecord
  has_many :writings
  has_rich_text :bio

  include Decorable
end
