class Skill < ActiveRecord::Base
  include SampleScopes
  self.inheritance_column = nil
end
