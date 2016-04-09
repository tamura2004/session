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

ActiveRecord::Schema.define(version: 20160406111059) do

  create_table "names", force: :cascade do |t|
    t.string   "type"
    t.string   "word"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pc_skills", force: :cascade do |t|
    t.integer  "pc_id"
    t.integer  "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "pc_skills", ["pc_id"], name: "index_pc_skills_on_pc_id"
  add_index "pc_skills", ["skill_id"], name: "index_pc_skills_on_skill_id"

  create_table "pcs", force: :cascade do |t|
    t.string   "gender"
    t.string   "handle"
    t.string   "name"
    t.integer  "exp"
    t.integer  "level"
    t.integer  "hp"
    t.integer  "mp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string   "type"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
