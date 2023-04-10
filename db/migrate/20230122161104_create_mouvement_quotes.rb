class CreateMouvementQuotes < ActiveRecord::Migration[7.0]
  def change
    create_table :mouvement_quotes do |t|
      t.string :location
      t.references :mouvement, null: false, foreign_key: true
      t.references :quote, null: false, foreign_key: true

      t.timestamps
    end
  end
end
