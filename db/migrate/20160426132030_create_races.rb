class CreateRaces < ActiveRecord::Migration
  def change
    create_table :races do |t|
      t.string :name
      t.string :size
      t.string :speed
      t.integer :str
      t.integer :dex
      t.integer :con
      t.integer :int
      t.integer :wis
      t.integer :cha
      t.string :skill
      t.string :sense
      t.string :damage_vulnerability

      t.timestamps null: false
    end
  end
end
