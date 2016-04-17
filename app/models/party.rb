class Party < ActiveRecord::Base
  belongs_to :player
  has_many :pcs
end
