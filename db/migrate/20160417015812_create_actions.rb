class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.references :character
      t.string :name              # アクション名
      t.string :range             # 遠隔/近接　:melee/:range
      t.string :mean              # 武器/呪文　:weapon/:spell
      t.string :hit               # 命中修正
      t.string :damege_formula    # ダメージ計算式
      t.string :damage_type       # ダメージ種別

      t.timestamps null: false
    end
  end
end
