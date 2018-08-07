class ChangeColumnNamePass < ActiveRecord::Migration[5.2]
  def change
    rename_column :passengers, :d_id, :rider_id
  end
end
