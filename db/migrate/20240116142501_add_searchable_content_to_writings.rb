class AddSearchableContentToWritings < ActiveRecord::Migration[7.1]
  def change
    add_column :writings, :searchable_content, :text
  end
end
