class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name
      t.string :timing
      t.string :kind
      t.string :mp
      t.string :range
      t.string :target
      t.string :element
      t.string :power
      t.string :effect

      t.timestamps null: false
    end
  end
end
