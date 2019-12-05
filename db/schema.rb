# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_05_000133) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drones", force: :cascade do |t|
    t.string "nickname"
    t.string "make_and_model"
    t.string "serial_number"
    t.integer "manufactured_year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "mission_drones", force: :cascade do |t|
    t.bigint "mission_id"
    t.bigint "drone_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["drone_id"], name: "index_mission_drones_on_drone_id"
    t.index ["mission_id"], name: "index_mission_drones_on_mission_id"
  end

  create_table "mission_pilots", force: :cascade do |t|
    t.bigint "mission_id"
    t.bigint "pilot_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mission_id"], name: "index_mission_pilots_on_mission_id"
    t.index ["pilot_id"], name: "index_mission_pilots_on_pilot_id"
  end

  create_table "missions", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.string "location"
    t.string "name"
    t.text "details"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pilots", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "certification_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "mission_drones", "drones"
  add_foreign_key "mission_pilots", "pilots"
end
