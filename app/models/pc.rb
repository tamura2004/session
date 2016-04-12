class Pc < Character
  has_many :skills, class_name: "PcSkill"
  has_many :klasses, class_name: "PcKlass"

  belongs_to :handle_before
  belongs_to :handle_after
  belongs_to :family_name
  belongs_to :given_name
  belongs_to :enchant_race
  belongs_to :race

  attr_accessor :words
  attr_accessor :races

  def abilities_description
    "肉体：#{body} 精神：#{mind} 速度：#{speed} 技術：#{tech} 支配：#{rule} 運命：#{fate}"
  end

  def body
    enchant_race.body + race.body
  end

  def mind
    enchant_race.mind + race.mind
  end

  def speed
    enchant_race.speed + race.speed
  end

  def tech
    enchant_race.tech + race.tech
  end

  def rule
    enchant_race.rule + race.rule
  end

  def fate
    enchant_race.fate + race.fate
  end

  def handle
    handle_before.name + handle_after.name
  end

  def name
    family_name.name + " " + given_name.name
  end

  def full_name
    "\"#{handle}\" #{name}"
  end

  def race_name
    "#{enchant_race.name}#{race.name}"
  end

  def klass_name
    klasses.map(&:name).join(" / ")
  end

  def male?
    gender == "male"
  end

end
