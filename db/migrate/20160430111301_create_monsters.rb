class CreateMonsters < ActiveRecord::Migration
  def change
    create_table :monsters do |t|
      t.references :menu, index: true, foreign_key: true
      t.string :name
      t.integer :hit
      t.integer :escape
      t.integer :damage
      t.integer :defence
      t.integer :hp
      t.integer :gp
      t.integer :exp

      t.timestamps null: false
    end
  end
end
