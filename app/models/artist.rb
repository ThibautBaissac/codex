class Artist < ApplicationRecord
  has_many :writings
  has_rich_text :bio

  include Decorable

  def random_writings(limit = 5)
    writings.order('RANDOM()').limit(limit)
  end

  def years_of_writings
    writings.pluck(:date).map(&:year).uniq.sort
  end
end
