class BattleForm
  include ActiveModel::Model
  attr_accessor :monsters, :action, :monster_id

  def initialize(encounter)
    @monsters = encounter.monsters
  end
end
