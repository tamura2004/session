class Battle < ActiveRecord::Base
  include AASM

  belongs_to :player
  belongs_to :menu
  belongs_to :pc
  belongs_to :equipment
  belongs_to :monster

  aasm do
    state :start, initial: true
    state :wait_for_pc
    state :wait_for_equipment
    state :levelup
    state :eliminate

    event :message do
      transitions from: :start, to: :wait_for_pc
    end

    event :input_pc do
      transitions from: :wait_for_pc, to: :wait_for_equipment
    end

    event :input_equipment do
      transitions from: :wait_for_equipment, to: :wait_for_pc
    end
  end
end
