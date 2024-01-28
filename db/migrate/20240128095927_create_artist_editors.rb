class CreateArtistEditors < ActiveRecord::Migration[7.1]
  def change
    create_table :artist_editors do |t|
      t.references :user, null: false, foreign_key: true
      t.references :artist, null: false, foreign_key: true

      t.timestamps
    end
    add_index :artist_editors, %i[artist_id user_id], unique: true
  end
end
