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

ActiveRecord::Schema.define(version: 20180529200647) do

  create_table "coaches", force: :cascade do |t|
    t.float "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spoken_languages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spoken_languages_users", id: false, force: :cascade do |t|
    t.integer "spoken_language_id", null: false
    t.integer "user_id", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "birthdate"
    t.string "mother_tongue"
    t.boolean "coach", default: false
    t.string "phone"
    t.string "address_formatted_address"
    t.string "address_street_number"
    t.string "address_street_name"
    t.string "address_street"
    t.string "address_city"
    t.string "address_zip_code"
    t.string "address_department"
    t.string "address_department_code"
    t.string "address_state"
    t.string "address_state_code"
    t.string "address_country"
    t.string "address_country_code"
    t.float "address_lat"
    t.float "address_lng"
    t.string "address"
    t.integer "street_number"
    t.string "locality"
    t.string "route"
    t.string "administrative_area_level_1"
    t.string "country"
    t.integer "postal_code"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
