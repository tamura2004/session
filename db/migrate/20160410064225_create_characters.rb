class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :type

      # 第一区画
      t.string :name                  # 名称
      # t.string :size                # サイズ区分
      t.references :race              # 種族
      t.string :klass                 #　クラス
      t.references :alignment         # 属性
      t.integer :exp                  # 経験値
      t.integer :level                # レベル
      t.integer :gp                   # 所持金

      # 第二区画
      t.integer :ac                   # アーマークラス
      t.string :ac_type               # アーマークラス種別
      t.integer :hp                   # ヒットポイント
      t.string :hp_formula            # ヒットポイント計算式
      t.string :speed                 # 移動速度

      # 第三区画（能力値）
      # t.integer :str                  # 筋力
      # t.integer :dex                  # 敏捷
      # t.integer :con                  # 耐久
      # t.integer :int                  # 知力
      # t.integer :wis                  # 判断
      # t.integer :cha                  # 魅力

      # 第四区画
      t.string :skill                 # 一般技能
      t.string :sense                 # 感覚
      t.string :damage_vulnerability  # ダメージ脆弱性
      t.string :damage_resistance     # ダメージ抵抗
      t.string :damage_immunity       # ダメージ完全耐性
      t.string :language              # 言語
      t.integer :challenge            # 脅威度

      # 第六区画
      t.string :condition             # 状態異常
      t.references :party             # 所属パーティ

      t.timestamps null: false
    end
  end
end
