class RemoveColumnPassFromRider < ActiveRecord::Migration[5.2]
  def change
    remove_column :riders, :pass, :integer
    remove_column :riders, :PT, :string
    remove_column :riders, :rider, :string
  end
end
