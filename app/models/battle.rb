class Battle < ActiveRecord::Base
  has_one :player, dependent: :nullify
  belongs_to :pc
  belongs_to :equipment
  belongs_to :monster

  def attack!
    pc.attack(equipment, monster)
    if player.menu.monsters.empty?
      Log.info("戦闘に勝利した")
      delete
    else
      player.menu.monsters.each do |monster|
        pc = player.pcs.choose
        monster.attack(pc)
      end
      if player.pcs.where(state: "正常").empty?
        Log.info("全滅した")
        player.update(menu: Menu.find_by(name: "リルガミン城"))
        delete
      else
        update(pc: nil, equipment: nil, monster: nil)
      end
    end
  end

end
