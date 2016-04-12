class CreateEncountersMonsters < ActiveRecord::Migration
  def change
    create_table :encounters_monsters do |t|
      t.string :label
      t.integer :hp
      t.references :monster
      t.references :encounter, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
