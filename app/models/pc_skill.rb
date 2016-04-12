class PcSkill < ActiveRecord::Base
  include SampleScopes
  belongs_to :pc
  belongs_to :skill
end
