class CreatePassengers < ActiveRecord::Migration[5.2]
  def change
    create_table :passengers do |t|
      t.string :fname
      t.string :lname
      t.integer :age
      t.string :tshitr
      t.integer :d_id

      t.timestamps
    end
  end
end
