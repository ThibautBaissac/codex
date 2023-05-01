class CreateConcerts < ActiveRecord::Migration[7.0]
  def change
    create_table :concerts do |t|
      t.date :date
      t.time :time
      t.string :location
      t.text :artists
      t.text :program
      t.text :notes

      t.timestamps
    end
  end
end
