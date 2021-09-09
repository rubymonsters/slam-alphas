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

ActiveRecord::Schema.define(version: 2021_09_09_175904) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.string "city"
    t.integer "user_id"
    t.integer "relationship"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "country"
    t.string "email"
    t.integer "year_of_birth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "website"
    t.string "facebook_link"
    t.float "latitude"
    t.float "longitude"
    t.string "encrypted_password", limit: 128
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128
    t.boolean "public", default: false
    t.boolean "admin", default: false
    t.string "avatar"
    t.text "video_link"
    t.boolean "alpha", default: false, null: false
    t.text "is_available_on", default: [], array: true
    t.integer "recommended_by", default: 0
    t.string "will_travel"
    t.text "travels_via", default: [], array: true
    t.text "train_bonus_card", default: [], array: true
    t.text "custom_availability", default: "", null: false
    t.text "bookable_as", default: [], array: true
    t.string "pronouns", default: ""
    t.string "instagram"
    t.string "twitter"
    t.string "tiktok"
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

end
