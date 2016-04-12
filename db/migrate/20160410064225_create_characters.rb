class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :type

      t.references :player

      t.string :gender

      t.string :name_order # :east, :west
      t.references :handle_before, index: true, foreign_key: true
      t.references :handle_after, index: true, foreign_key: true
      t.references :family_name, index: true, foreign_key: true
      t.references :given_name, index: true, foreign_key: true

      t.references :enchant_race, index: true, foreign_key: true
      t.references :race, index: true, foreign_key: true

      t.references :enchant_klass, index: true, foreign_key: true
      t.references :klass, index: true, foreign_key: true

      t.integer :damage # 受けているダメージ

      t.integer :body
      t.integer :mind
      t.integer :speed
      t.integer :tech
      t.integer :rule
      t.integer :fate

      t.integer :hp # ヒットポイント
      t.integer :wp # 可搬重量
      t.integer :mp # 魔力量
      t.integer :sp # 技量ポイント
      t.integer :tp # テクノロジポイント
      t.integer :gp # ゴールド
      t.integer :pp # プラーナ

      t.timestamps null: false
    end
  end
end
