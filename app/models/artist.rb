class Artist < ApplicationRecord
  has_many :writings
  has_rich_text :bio

  include Decorable

  def random_writings(limit = 5)
    writings_to_include = []
    writings_to_include << :rich_text_content if writings.joins(:rich_text_content).exists?
    writings_to_include << :annotations if writings.joins(:annotations).exists?

    writings.includes(writings_to_include).order("RANDOM()").limit(limit)
  end

  def years_of_writings
    writings.pluck(:date).map(&:year).uniq.sort
  end
end
