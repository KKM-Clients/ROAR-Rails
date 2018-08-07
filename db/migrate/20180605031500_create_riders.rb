class CreateRiders < ActiveRecord::Migration[5.2]
  def change
    create_table :riders do |t|
      t.string :DFN
      t.string :DLN
      t.string :DMA
      t.string :DC
      t.string :DS
      t.string :DZ
      t.string :DCP
      t.string :DEA
      t.string :ECFN
      t.string :ECLN
      t.string :ECCP
      t.string :ECT
      t.string :ExpLev
      t.string :RD
      t.string :DTS
      t.integer :FLH
      t.integer :FLT
      t.integer :SLH
      t.integer :SLT
      t.string :PT
      t.string :RRCW

      t.timestamps
    end
  end
end
