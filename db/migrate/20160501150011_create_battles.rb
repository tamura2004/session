class CreateBattles < ActiveRecord::Migration
  def change
    create_table :battles do |t|

      t.references :pc, index: true, foreign_key: true
      t.references :equipment, index: true, foreign_key: true
      t.references :monster, index: true, foreign_key: true

      t.string :state # "PC指定待ち"->"アイテム指定待ち"->"モンスター指定待ち"

      t.timestamps null: false
    end
  end
end
