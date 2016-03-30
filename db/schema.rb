# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160330141531) do

  create_table "comments", force: :cascade do |t|
    t.string   "author"
    t.text     "body"
    t.integer  "fighter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fighter_fights", force: :cascade do |t|
    t.integer "fighter_id"
    t.integer "fight_id"
  end

  add_index "fighter_fights", ["fight_id"], name: "index_fighter_fights_on_fight_id"
  add_index "fighter_fights", ["fighter_id"], name: "index_fighter_fights_on_fighter_id"

  create_table "fighter_skills", force: :cascade do |t|
    t.integer "value",      default: 1
    t.integer "skill_id"
    t.integer "fighter_id"
  end

  add_index "fighter_skills", ["fighter_id", "skill_id"], name: "index_fighter_skills_on_fighter_id_and_skill_id", unique: true
  add_index "fighter_skills", ["fighter_id"], name: "index_fighter_skills_on_fighter_id"
  add_index "fighter_skills", ["skill_id"], name: "index_fighter_skills_on_skill_id"

  create_table "fighters", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "nickname"
    t.string   "image"
    t.integer  "experience", default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "fights", force: :cascade do |t|
    t.integer  "winner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "fights", ["winner_id"], name: "index_fights_on_winner_id"

  create_table "skills", force: :cascade do |t|
    t.string "name"
  end

end
