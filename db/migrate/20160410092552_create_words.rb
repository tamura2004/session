class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :type
      t.boolean :is_male
      t.boolean :is_female
      t.boolean :is_kanji
      t.boolean :is_kana
      t.string :name

      t.timestamps null: false
    end
  end
end
