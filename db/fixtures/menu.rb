menu = YAML.load (<<MENU)
---
リルガミン城:
  ギルガメッシュの酒場:
    パーティに加える:
    パーティから外す:
    ステータスを見る:
    酒場を出る: リルガミン城
  冒険者の宿:
    馬小屋: :rest_pc
    簡易寝台: :rest_pc
    エコノミールーム: :rest_pc
    スイートルーム: :rest_pc
    ロイヤルスイート: :rest_pc
    宿を出る: リルガミン城
  ボルタック商店:
    アイテムを買う:
    アイテムを売る:
    呪いを解く:
      呪いのアイテム選択:
        アイテムを解呪する: ボルタック商店
    アイテムの鑑定:
      鑑定アイテム選択:
        アイテムを鑑定する: ボルタック商店
    店を出る: リルガミン城
  カント寺院:
    寺院を出る: リルガミン城
  訓練場:
    新しいキャラクターを作る:
      # - 能力値を選択
      # - 種族を選択
      # - クラスを選択
      # - 名前を選択
    ステータスを見る:
      - キャラクターを選択
      - キャラクターを表示
    キャラクターを削除する:
      - キャラクターを選択
      - キャラクターを削除
    キャラクターの名前を変える:
    キャラクターの職業を変える:
  地下迷宮:
    - 地下1層
    - 地下2層
    - 地下3層
    - 地下4層
    - 地下5層
    - 地下6層
    - 地下7層
    - 地下8層
    - 地下9層
    - 地下10層
MENU

class MenuFactory
  attr_accessor :menus

  def initialize
    @id = 0
  end

  def id
    @id += 1
  end

  def build(parent_id, menus)
    case menus
    when Hash
      menus.each do |name,children|
        case children
        when Hash, Array
          menu = Menu.seed(id: id, name: name, menu_id: parent_id).first
          build(menu.id, children)
        else
          Menu.seed(id: id, name: name, menu_id: parent_id, path: children)

        end
      end

    when Array
      menus.each do |name|
        menu = Menu.seed(id: id, name: name, menu_id: parent_id).first
        parent_id = menu.id
      end

    else
      Menu.seed(id: id, name: menus, menu_id: parent_id)
    end

  end
end

Menu.delete_all
f = MenuFactory.new
f.build(nil, menu)