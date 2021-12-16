# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_09_01_173632) do

  create_table "assignments", force: :cascade do |t|
    t.time "arrival"
    t.time "departure"
    t.integer "platform_id", null: false
    t.integer "train_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["platform_id"], name: "index_assignments_on_platform_id"
    t.index ["train_id"], name: "index_assignments_on_train_id"
  end

  create_table "platforms", force: :cascade do |t|
    t.integer "platform_num"
    t.integer "station_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["station_id"], name: "index_platforms_on_station_id"
  end

  create_table "stations", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "trains", force: :cascade do |t|
    t.string "train_num"
    t.string "service_type"
    t.string "origin"
    t.string "destination"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "assignments", "platforms"
  add_foreign_key "assignments", "trains"
  add_foreign_key "platforms", "stations"
end
