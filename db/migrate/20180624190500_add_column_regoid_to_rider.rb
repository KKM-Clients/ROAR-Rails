class AddColumnRegoidToRider < ActiveRecord::Migration[5.2]
  def change
    add_column :riders, :rider, :string
    add_column :riders, :regid, :integer
  end
end
