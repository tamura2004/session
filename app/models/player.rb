class Player < ActiveRecord::Base
  has_many :pcs
  belongs_to :pc
end
