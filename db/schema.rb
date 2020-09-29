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

ActiveRecord::Schema.define(version: 2020_09_29_012240) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "address_1"
    t.string "address_2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "userable_type"
    t.bigint "userable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["userable_type", "userable_id"], name: "index_addresses_on_userable_type_and_userable_id"
  end

  create_table "carriers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "division"
    t.integer "major_group"
    t.integer "industry_group"
    t.integer "sic"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "policies", force: :cascade do |t|
    t.bigint "client_id"
    t.bigint "carrier_id"
    t.string "division"
    t.date "effective_date"
    t.date "expiration_date"
    t.integer "written_premium"
    t.integer "carrier_policy_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["carrier_id"], name: "index_policies_on_carrier_id"
    t.index ["client_id"], name: "index_policies_on_client_id"
  end

end
