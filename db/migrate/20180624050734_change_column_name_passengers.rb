class ChangeColumnNamePassengers < ActiveRecord::Migration[5.2]
  def change
    rename_column :passengers, :tshitr, :tshirt
  end
end
