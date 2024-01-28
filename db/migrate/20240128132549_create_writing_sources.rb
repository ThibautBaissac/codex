class CreateWritingSources < ActiveRecord::Migration[7.1]
  def change
    create_table :writing_sources do |t|
      t.references :writing, null: false, foreign_key: true
      t.references :source, null: false, foreign_key: true

      t.timestamps
    end

    add_index :writing_sources, %i[writing_id source_id], unique: true
  end
end
