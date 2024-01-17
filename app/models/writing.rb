class Writing < ApplicationRecord
  belongs_to :artist
  has_rich_text :content
  has_many :taggings, as: :taggable, dependent: :destroy
  has_many :tags, through: :taggings
  has_many :annotations, as: :annotatable

  scope :tagged_with, ->(tag_name) { joins(:tags).where(tags: { name: tag_name&.strip&.downcase }) }

  after_save :update_searchable_content

  def self.search_by_content(query)
    words = query.split
    words.map! { |word| "%#{word}%" }
    where(words.map { |word| "searchable_content ILIKE ?" }.join(" AND "), *words)
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
    Tag.joins(:taggings).where(taggings: {taggable_type: "Writing"}).distinct.order(:name)
  end

  def annotation_list
    annotations.includes([:rich_text_content]).order(updated_at: :desc)
  end

  private

  def update_searchable_content
    update_column(:searchable_content, content.to_plain_text)
  end
end
