class Player < ActiveRecord::Base
  has_many :pcs
  belongs_to :pc
  belongs_to :menu
  belongs_to :battle

  after_initialize :set_default_value

  def reset!
    if battle
      battle.delete
    end
  end

  def set_default_value
    self.menu ||= Menu.by_name("リルガミン城")
    self.log ||= Time.zone.now
  end
end
