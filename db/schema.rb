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

ActiveRecord::Schema.define(version: 20160410092552) do

  create_table "cards", force: :cascade do |t|
    t.string   "type"
    t.string   "name"
    t.integer  "body"
    t.integer  "mind"
    t.integer  "speed"
    t.integer  "tech"
    t.integer  "rule"
    t.integer  "fate"
    t.integer  "weight"
    t.integer  "cost"
    t.integer  "attack"
    t.integer  "defence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "characters", force: :cascade do |t|
    t.string   "type"
    t.string   "gender"
    t.string   "name_order"
    t.integer  "handle_before_id"
    t.integer  "handle_after_id"
    t.integer  "family_name_id"
    t.integer  "given_name_id"
    t.integer  "enchant_race_id"
    t.integer  "race_id"
    t.integer  "enchant_klass_id"
    t.integer  "klass_id"
    t.integer  "damage"
    t.integer  "body"
    t.integer  "mind"
    t.integer  "speed"
    t.integer  "tech"
    t.integer  "rule"
    t.integer  "fate"
    t.integer  "hp"
    t.integer  "wp"
    t.integer  "mp"
    t.integer  "sp"
    t.integer  "tp"
    t.integer  "gp"
    t.integer  "pp"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "characters", ["enchant_klass_id"], name: "index_characters_on_enchant_klass_id"
  add_index "characters", ["enchant_race_id"], name: "index_characters_on_enchant_race_id"
  add_index "characters", ["family_name_id"], name: "index_characters_on_family_name_id"
  add_index "characters", ["given_name_id"], name: "index_characters_on_given_name_id"
  add_index "characters", ["handle_after_id"], name: "index_characters_on_handle_after_id"
  add_index "characters", ["handle_before_id"], name: "index_characters_on_handle_before_id"
  add_index "characters", ["klass_id"], name: "index_characters_on_klass_id"
  add_index "characters", ["race_id"], name: "index_characters_on_race_id"

  create_table "words", force: :cascade do |t|
    t.string   "type"
    t.boolean  "is_male"
    t.boolean  "is_female"
    t.boolean  "is_kanji"
    t.boolean  "is_kana"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
