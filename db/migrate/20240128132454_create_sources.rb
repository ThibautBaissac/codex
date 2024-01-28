class CreateSources < ActiveRecord::Migration[7.1]
  def change
    create_table :sources do |t|
      t.string :name, null: false
      t.references :artist, null: false, foreign_key: true

      t.timestamps
    end

    add_index :sources, %i[name artist_id], unique: true
  end
end
