class RemoveDefaultFromWithInfluence < ActiveRecord::Migration[7.0]
  def change
    change_column_default :elements, :with_influence, nil
  end
end
