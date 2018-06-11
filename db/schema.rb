# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_06_07_002046) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "riders", force: :cascade do |t|
    t.string "DFN"
    t.string "DLN"
    t.string "DMA"
    t.string "DC"
    t.string "DS"
    t.string "DZ"
    t.string "DCP"
    t.string "DEA"
    t.string "ECFN"
    t.string "ECLN"
    t.string "ECCP"
    t.string "ECT"
    t.string "ExpLev"
    t.string "RD"
    t.string "DTS"
    t.integer "FLH"
    t.integer "FLT"
    t.integer "SLH"
    t.integer "SLT"
    t.string "PT"
    t.string "RRCW"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pass"
  end

end
