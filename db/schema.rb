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

ActiveRecord::Schema.define(version: 2019_07_29_233436) do

  create_table "code_times", force: :cascade do |t|
    t.integer "code_id", null: false
    t.integer "time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "out_put"
    t.float "uptime", default: 0.0
    t.index ["code_id"], name: "index_code_times_on_code_id"
  end

  create_table "codes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "theme_id"
    t.index ["user_id"], name: "index_codes_on_user_id"
  end

  create_table "theme_images", force: :cascade do |t|
    t.integer "theme_id"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["theme_id"], name: "index_theme_images_on_theme_id"
  end

  create_table "themes", force: :cascade do |t|
    t.string "title", null: false
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
  end

end
