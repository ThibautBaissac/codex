class CreateWorks < ActiveRecord::Migration[7.0]
  def change
    create_table :works do |t|
      t.string :title
      t.integer :opus
      t.text :description
      t.string :instrumentation, array: true, default: []

      t.timestamps
    end
  end
end
