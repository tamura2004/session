class PcSkill < ActiveRecord::Base
  belongs_to :pc
  belongs_to :skill
end
