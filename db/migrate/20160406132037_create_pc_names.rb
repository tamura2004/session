class CreatePcNames < ActiveRecord::Migration
  def change
    create_table :pc_names do |t|
      t.string :gender
      t.string :name

      t.timestamps null: false
    end
  end
end
