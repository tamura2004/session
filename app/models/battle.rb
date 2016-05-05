class Battle < ActiveRecord::Base
  has_one :player, dependent: :nullify
  belongs_to :pc
  belongs_to :equipment
  belongs_to :monster

  def status
    pc_name = pc.try(:name) || "選択中"
    equipment_name = equipment.try(:name) || "選択中"
    monster_name = monster.try(:name) || "選択中"
    "誰が：#{pc_name}　手段：#{equipment_name}　対象：#{monster_name}"
  end

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
      if player.pcs.where.not(state: "死亡").empty?
        Log.info("全滅した")
        player.update(menu: Menu.find_by(name: "リルガミン城"))
        delete
      else
        update(pc: nil, equipment: nil, monster: nil)
      end
    end
  end

end
