class CreateEncounters < ActiveRecord::Migration
  def change
    create_table :encounters do |t|
      t.string :name
      t.text :memo
      t.references :scinario

      t.timestamps null: false
    end
  end
end
