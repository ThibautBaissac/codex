class WritingSource < ApplicationRecord
  belongs_to :writing
  belongs_to :source

  validates :writing_id, uniqueness: {scope: :source_id}
end
