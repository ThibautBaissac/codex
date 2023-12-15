class CreateArtists < ActiveRecord::Migration[7.1]
  def change
    create_table :artists do |t|
      t.string :firstname
      t.string :lastname
      t.date :birthdate
      t.date :deathdate

      t.timestamps
    end
  end
end
