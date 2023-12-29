class CreateAnnotations < ActiveRecord::Migration[7.1]
  def change
    create_table :annotations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :annotatable, polymorphic: true, null: false
      t.text :content

      t.timestamps
    end
  end
end
