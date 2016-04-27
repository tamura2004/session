class Item < ActiveRecord::Base
  def label
    "%40s %5dgp" % [name, gp]
  end
end
