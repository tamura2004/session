class Equipment < ActiveRecord::Base
  belongs_to :pc
  belongs_to :item

  delegate :name, :gp, :label, to: :item

end
