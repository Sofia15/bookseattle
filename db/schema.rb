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

ActiveRecord::Schema.define(version: 20170629234626) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "booked_rates", force: :cascade do |t|
    t.bigint "room_id", null: false
    t.bigint "reservation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reservation_id"], name: "index_booked_rates_on_reservation_id"
    t.index ["room_id"], name: "index_booked_rates_on_room_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.text "markdown", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_locations_on_name", unique: true
  end

  create_table "reservations", force: :cascade do |t|
    t.boolean "cancelled", default: false
    t.daterange "reservation_duration", null: false
    t.bigint "room_id", null: false
    t.bigint "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_reservations_on_account_id"
    t.index ["cancelled"], name: "index_reservations_on_cancelled"
    t.index ["room_id", "reservation_duration"], name: "index_reservations_on_room_id_and_reservation_duration", unique: true
    t.index ["room_id"], name: "index_reservations_on_room_id"
  end

  create_table "room_rates", force: :cascade do |t|
    t.decimal "rate", precision: 10, scale: 2, default: "0.0", null: false
    t.daterange "rate_duration", null: false
    t.bigint "room_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_room_rates_on_room_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.text "markdown", null: false
    t.bigint "location_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_rooms_on_location_id"
  end

end
