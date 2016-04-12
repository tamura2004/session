class CreateScinarios < ActiveRecord::Migration
  def change
    create_table :scinarios do |t|
      t.string :name
      t.text :memo

      t.timestamps null: false
    end
  end
end
