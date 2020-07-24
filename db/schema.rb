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

ActiveRecord::Schema.define(version: 2020_07_24_180825) do

  create_table "airplanes", force: :cascade do |t|
    t.string "model"
    t.string "registration"
    t.integer "seatings"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "company_id", null: false
    t.index ["company_id"], name: "index_airplanes_on_company_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "flights", force: :cascade do |t|
    t.datetime "departure_date"
    t.datetime "arrival_date"
    t.datetime "arrival"
    t.string "name"
    t.integer "state_code"
    t.string "departure_place"
    t.string "arrival_place"
    t.string "airport"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "airplane_id", null: false
    t.index ["airplane_id"], name: "index_flights_on_airplane_id"
  end

  add_foreign_key "airplanes", "companies"
  add_foreign_key "flights", "airplanes"
end
