class Writing < ApplicationRecord
  belongs_to :writer
  has_rich_text :content
end
