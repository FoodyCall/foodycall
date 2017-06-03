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

ActiveRecord::Schema.define(version: 20170531154538) do

  create_table "event_menus", force: :cascade do |t|
    t.string "event_id"
    t.string "name"
    t.string "type_id"
    t.string "recipe"
  end

  create_table "event_participants", force: :cascade do |t|
    t.string "event_id"
    t.string "user_id"
    t.string "role_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "event_id"
    t.string "name"
    t.string "location"
    t.string "host"
    t.date "date"
    t.string "img_path"
  end

  create_table "roles", force: :cascade do |t|
    t.string "role_id"
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.date "birthday"
    t.string "country"
    t.string "city"
    t.string "password"
    t.string "img_path"
  end

end
