class CreateAbilities < ActiveRecord::Migration
  def change
    create_table :abilities do |t|

      t.references :pc                # PC

      t.integer :str                  # 筋力
      t.integer :dex                  # 敏捷
      t.integer :con                  # 耐久
      t.integer :int                  # 知力
      t.integer :wis                  # 判断
      t.integer :cha                  # 魅力

      t.timestamps null: false
    end
  end
end
