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

ActiveRecord::Schema.define(version: 20160426133711) do

  create_table "abilities", force: :cascade do |t|
    t.integer  "pc_id"
    t.integer  "str"
    t.integer  "dex"
    t.integer  "con"
    t.integer  "int"
    t.integer  "wis"
    t.integer  "cha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "actions", force: :cascade do |t|
    t.integer  "character_id"
    t.string   "name"
    t.string   "range"
    t.string   "mean"
    t.string   "hit"
    t.string   "damege_formula"
    t.string   "damage_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "alignments", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "characters", force: :cascade do |t|
    t.string   "type"
    t.string   "name"
    t.integer  "race_id"
    t.string   "klass"
    t.integer  "alignment_id"
    t.integer  "exp"
    t.integer  "level"
    t.integer  "gp"
    t.integer  "ac"
    t.string   "ac_type"
    t.integer  "hp"
    t.string   "hp_formula"
    t.string   "speed"
    t.string   "skill"
    t.string   "sense"
    t.string   "damage_vulnerability"
    t.string   "damage_resistance"
    t.string   "damage_immunity"
    t.string   "language"
    t.integer  "challenge"
    t.string   "condition"
    t.integer  "party_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.integer  "gp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menus", force: :cascade do |t|
    t.string   "name"
    t.string   "path"
    t.boolean  "visible"
    t.integer  "menu_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "menus", ["menu_id"], name: "index_menus_on_menu_id"

  create_table "parties", force: :cascade do |t|
    t.integer  "player_id"
    t.string   "area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "parties", ["player_id"], name: "index_parties_on_player_id"

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.integer  "pc_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "races", force: :cascade do |t|
    t.string   "name"
    t.string   "size"
    t.string   "speed"
    t.integer  "str"
    t.integer  "dex"
    t.integer  "con"
    t.integer  "int"
    t.integer  "wis"
    t.integer  "cha"
    t.string   "skill"
    t.string   "sense"
    t.string   "damage_vulnerability"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

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
