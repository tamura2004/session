class CreatePcSkills < ActiveRecord::Migration
  def change
    create_table :pc_skills do |t|
      t.references :pc, index: true, foreign_key: true
      t.references :skill, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
