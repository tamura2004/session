class Party < ActiveRecord::Base
  belongs_to :player
  has_many :pcs

  after_initialize do
    self.name ||= HandleBefore.choose.name + HandleAfter.choose.name
  end

end


