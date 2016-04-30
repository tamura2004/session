class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :name
      t.references :player, index: true, foreign_key: true
      t.references :menu, index: true, foreign_key: true
      t.string :area

      t.timestamps null: false
    end
  end
end
