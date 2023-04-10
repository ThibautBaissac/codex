class CreateMouvements < ActiveRecord::Migration[7.0]
  def change
    create_table :mouvements do |t|
      t.integer :number
      t.string :title
      t.string :dedication
      t.date :start_date
      t.date :end_date
      t.references :work, null: false, foreign_key: true

      t.timestamps
    end
  end
end
