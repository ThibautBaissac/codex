class CreateMouvementElements < ActiveRecord::Migration[7.0]
  def change
    create_table :mouvement_elements do |t|
      t.string :location
      t.references :mouvement, null: false, foreign_key: true
      t.references :element, null: false, foreign_key: true

      t.timestamps
    end
  end
end
