class CreatePcs < ActiveRecord::Migration
  def change
    create_table :pcs do |t|
      t.references :handle, index: true, foreign_key: true
      t.references :pc_name, index: true, foreign_key: true
      t.integer :exp
      t.integer :level
      t.integer :hp
      t.integer :mp

      t.timestamps null: false
    end
  end
end
