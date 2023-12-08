class CreateWritings < ActiveRecord::Migration[7.1]
  def change
    create_table :writings do |t|
      t.date :date
      t.references :writer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
