class CreateEquipments < ActiveRecord::Migration
  def change
    create_table :equipments do |t|
      t.references :pc, index: true, foreign_key: true
      t.references :item, index: true, foreign_key: true
      t.integer :uses

      t.timestamps null: false
    end
  end
end
