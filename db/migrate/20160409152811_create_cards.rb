class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :type
      t.string :name

      # キャラクター能力
      t.integer :body          # 肉体
      t.integer :mind          # 精神
      t.integer :speed         # 速度
      t.integer :tech          # 技術
      t.integer :rule          # 支配
      t.integer :fate          # 運命

      # カード能力
      t.integer :weight        # 重量
      t.integer :cost          # 金額
      t.integer :attack        # 攻撃
      t.integer :defence       # 防御

      t.timestamps null: false
    end
  end
end
