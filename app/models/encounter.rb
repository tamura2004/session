class Encounter < ActiveRecord::Base
  belongs_to :scinario
  has_many :monsters, class_name: "EncountersMonster"
end
