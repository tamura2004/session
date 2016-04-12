class EncountersMonster < ActiveRecord::Base
  belongs_to :encounter
  belongs_to :monster

  def name
    "#{monster.name}#{label}"
  end

end
