class Writing < ApplicationRecord
  belongs_to :artist
  has_rich_text :content
  has_many :taggings, as: :taggable, dependent: :destroy
  has_many :tags, through: :taggings
  has_many :annotations, as: :annotatable

  scope :tagged_with, ->(tag_name) { joins(:tags).where(tags: { name: tag_name&.strip&.downcase }) }

  def self.search_by_content(query)
    joins("INNER JOIN action_text_rich_texts ON action_text_rich_texts.record_id = writings.id")
      .where("action_text_rich_texts.body ILIKE ?", "%#{query}%")
  end

  def tag_list
    tags.order(:name)
  end

  def add_tag(tag_name)
    tag = Tag.find_or_create_by(name: tag_name)
    tags << tag unless tags.include?(tag)
  end

  def remove_tag(tag_id)
    tag = Tag.find(tag_id)
    tags.delete(tag) if tag
  end

  def self.tags_for_display
    includes(:tags).map(&:tags).flatten.uniq.sort_by(&:name)
  end

  def annotation_list
    annotations.includes([:rich_text_content]).order(:updated_at)
  end
end
