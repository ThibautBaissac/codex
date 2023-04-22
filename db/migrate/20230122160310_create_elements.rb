class CreateElements < ActiveRecord::Migration[7.0]
  def change
    create_table :elements do |t|
      t.string :title
      t.string :category, array: true, default: [], null: false
      t.text :description
      t.text :history
      t.string :instrumentation, array: true, default: []
      t.boolean :popular, default: false
      t.boolean :with_influence, default: false

      t.timestamps
    end
  end
end
