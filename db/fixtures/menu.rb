menu = YAML.load (<<MENU)
---
root:
  街外れ:
    訓練場:
      新しいキャラクターを作る:
        能力値を選択:
          種族を選択:
            クラスを選択:
              名前を選択:
                キャラクター作成:
      ステータスを見る: :pcs
      キャラクターを削除する: :pcs
      キャラクターの名前を変える: :edit_pc_name
      キャラクターの職業を変える: :edit_pc_job
      城に戻る:
    リルガミン城:
      ギルガメッシュの酒場:
        パーティに加える: :edit_pc_party
        パーティから外す: :delete_pc_party
        ステータスを見る: :pcs
      冒険者の宿:
        馬小屋: :rest_pc
        簡易寝台: :rest_pc
        エコノミールーム: :rest_pc
        スイートルーム: :rest_pc
        ロイヤルスイート: :rest_pc
      ボルタック商店:
        アイテムを買う:
          購入アイテム選択:
            誰が購入しますか？:
        アイテムを売る: :item_sell
        呪いを解く: :item_dispel
        アイテムを識別する: :item_identify
      カント寺院:
        死者を蘇生する: :temple_raise_dead
        灰から復活させる: :temple_reserrection
        麻痺を治す: :temple_cure_paralys
        毒を治す: :temple_neutralize_poison
        呪いを解く: :temple_remove_curse
    狂王の試練場:
      キャンプ:
        ステータスを見る:
        他のパーティを探す:
        メンバーを並べ替える:
        冒険を中断する:
      迷宮:
        地下1層:
          地下2層:
            地下3層:
              地下4層:
                地下5層:
                  地下6層:
                    地下7層:
                      地下8層:
                        地下9層:
                          地下10層:
  戦闘:
    武器で攻撃する: :battle_weapon
    魔法を使う: :battle_spell
    アイテムを使う: :battle_item
    身を守る: :battle_defence
    逃げる: :battle_escape
MENU

class MenuFactory
  attr_accessor :menus

  def initialize
    @id = 0
    # @menus = []
  end

  def create(hash,parent)
    hash.each do |entry,children|
      @id += 1

      case children
      when Hash
        # @menus << [@id, parent, entry, nil]
        Menu.seed do |s|
          s.id = @id
          s.name = entry
          s.menu_id = parent
          s.path = nil
          s.visible = true
        end
        create(children,@id)

      else
        Menu.seed do |s|
          s.id = @id
          s.name = entry
          s.menu_id = parent
          s.path = children
          s.visible = true
        end
        # @menus << [@id, parent, entry, v]
      end
    end
  end
end

f = MenuFactory.new
f.create(menu,nil)