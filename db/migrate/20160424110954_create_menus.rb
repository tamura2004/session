class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :name
      t.string :path
      t.boolean :visible
      t.references :menu, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
