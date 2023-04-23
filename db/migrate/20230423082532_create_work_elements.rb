class CreateWorkElements < ActiveRecord::Migration[7.0]
  def change
    create_table :work_elements do |t|
      t.references :work, null: false, foreign_key: true
      t.references :element, null: false, foreign_key: true

      t.timestamps
    end
  end
end
