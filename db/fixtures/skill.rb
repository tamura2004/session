# rails g model klass name
# rails g model skill name timing kind mp range target attribute power effect

require "csv"

@id = 0
def id
  @id += 1
end

CSV.read(Rails.root.join("db/fixtures/klass.csv")).each do |row|
  Klass.seed do |s|
    s.id = id
    s.name = row.first
  end
end

@id = 0
CSV.read(Rails.root.join("db/fixtures/skill.csv")).each do |row|
  klass,name,timing,kind,mp,range,target,element,power,effect = *row
  Skill.seed do |s|
    s.id = id
    s.name = name
    s.timing = timing
    s.kind = kind
    s.mp = mp
    s.range = range
    s.target = target
    s.element = element
    s.power = power
    s.effect = effect
  end
end
