class AddExtractSize < ActiveRecord::Migration[7.0]
  def change
    add_column :elements, :extract_size, :integer, null: false, default: 100
  end
end
