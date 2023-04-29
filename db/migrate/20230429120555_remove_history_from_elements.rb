class RemoveHistoryFromElements < ActiveRecord::Migration[7.0]
  def change
    remove_column :elements, :history, :text
  end
end
