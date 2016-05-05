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

ActiveRecord::Schema.define(version: 20160501150011) do

  create_table "alignments", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "battles", force: :cascade do |t|
    t.integer  "pc_id"
    t.integer  "equipment_id"
    t.integer  "monster_id"
    t.string   "state"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "battles", ["equipment_id"], name: "index_battles_on_equipment_id"
  add_index "battles", ["monster_id"], name: "index_battles_on_monster_id"
  add_index "battles", ["pc_id"], name: "index_battles_on_pc_id"

  create_table "equipment", force: :cascade do |t|
    t.integer  "pc_id"
    t.integer  "item_id"
    t.integer  "uses"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "equipment", ["item_id"], name: "index_equipment_on_item_id"
  add_index "equipment", ["pc_id"], name: "index_equipment_on_pc_id"

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.integer  "gp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "logs", force: :cascade do |t|
    t.string   "message"
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

  create_table "monsters", force: :cascade do |t|
    t.integer  "menu_id"
    t.string   "name"
    t.integer  "hit"
    t.integer  "escape"
    t.integer  "damage"
    t.integer  "defence"
    t.integer  "hp"
    t.integer  "gp"
    t.integer  "exp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "monsters", ["menu_id"], name: "index_monsters_on_menu_id"

  create_table "pcs", force: :cascade do |t|
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
    t.integer  "str"
    t.integer  "dex"
    t.integer  "con"
    t.integer  "int"
    t.integer  "wis"
    t.integer  "cha"
    t.string   "skill"
    t.string   "sense"
    t.string   "damage_vulnerability"
    t.string   "damage_resistance"
    t.string   "damage_immunity"
    t.string   "language"
    t.integer  "challenge"
    t.string   "state"
    t.integer  "player_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.integer  "menu_id"
    t.integer  "battle_id"
    t.datetime "log"
    t.string   "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
