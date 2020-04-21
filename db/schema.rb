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

ActiveRecord::Schema.define(version: 2020_04_19_153605) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "area_codes", force: :cascade do |t|
    t.string "sa_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sa_code"], name: "index_area_codes_on_sa_code", unique: true
  end

  create_table "excavators", force: :cascade do |t|
    t.string "company_name"
    t.string "address"
    t.boolean "crew_onsite", default: false
    t.bigint "ticket_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ticket_id"], name: "index_excavators_on_ticket_id"
  end

  create_table "service_areas", force: :cascade do |t|
    t.bigint "ticket_id"
    t.bigint "area_code_id"
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["area_code_id"], name: "index_service_areas_on_area_code_id"
    t.index ["ticket_id"], name: "index_service_areas_on_ticket_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "request_number"
    t.integer "sequence_number"
    t.integer "request_type", default: 0
    t.datetime "response_due_date_time"
    t.string "well_known_text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["request_number"], name: "index_tickets_on_request_number", unique: true
  end

  add_foreign_key "excavators", "tickets"
  add_foreign_key "service_areas", "area_codes"
  add_foreign_key "service_areas", "tickets"
end
