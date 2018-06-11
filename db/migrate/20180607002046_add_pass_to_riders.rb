class AddPassToRiders < ActiveRecord::Migration[5.2]
  def change
    add_column :riders, :pass, :int
  end
end
