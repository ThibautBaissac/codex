class AddIndexToArtists < ActiveRecord::Migration[7.1]
  def change
    add_index :artists, %i[firstname lastname], unique: true
  end
end
