class CreatePcKlasses < ActiveRecord::Migration
  def change
    create_table :pc_klasses do |t|
      t.references :pc, index: true, foreign_key: true
      t.references :klass, index: true, foreign_key: true
      t.decimal :level

      t.timestamps null: false
    end
  end
end
