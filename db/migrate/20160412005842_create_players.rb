class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name

      t.references :menu
      t.references :battle

      t.datetime :log
      t.string :state

      t.timestamps null: false
    end
  end
end
