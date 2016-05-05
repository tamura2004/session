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
      monster.attack(pc)
      update(pc: nil, equipment: nil, monster: nil)
    end
  end

end
