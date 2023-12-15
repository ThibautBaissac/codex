class Artist < ApplicationRecord
  has_many :writings
  has_rich_text :bio

  include Decorable

  def limited_writings(limit = 5)
    writings.limit(limit)
  end
end
