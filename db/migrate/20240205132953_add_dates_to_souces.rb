class AddDatesToSouces < ActiveRecord::Migration[7.1]
  def change
    add_column :sources, :start_date, :date
    add_column :sources, :end_date, :date
  end
end
