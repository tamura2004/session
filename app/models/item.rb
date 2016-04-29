class Item < ActiveRecord::Base
  has_many :equipment
  def label
    "%40s %5dgp" % [name, gp]
  end
end
