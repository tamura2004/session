class CreatePcs < ActiveRecord::Migration
  def change
    create_table :pcs do |t|
      t.string :gender
      t.string :handle
      t.string :name
      t.integer :exp
      t.integer :level
      t.integer :hp
      t.integer :mp

      t.timestamps null: false
    end
  end
end
