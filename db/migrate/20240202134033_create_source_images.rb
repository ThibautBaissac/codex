class CreateSourceImages < ActiveRecord::Migration[7.1]
  def change
    create_table :source_images do |t|
      t.references :source, null: false, foreign_key: true
      t.boolean :is_cover

      t.timestamps
    end
  end
end
