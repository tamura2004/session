@id = 0
def id
  @id += 1
end

Card.delete_all

filepath = File.join(Rails.root,"db/fixtures/xlsx/seed.xlsx")
xlsx = Roo::Spreadsheet.open(filepath)

xlsx.sheet("Race").each do |row|
  type,name,body,mind,speed,tech,rule,fate = row
  next if type != "Race"

  Card.seed do |s|
    s.id = id
    s.type = type
    s.name = name
    s.body = body
    s.mind = mind
    s.speed = speed
    s.tech = tech
    s.rule = rule
    s.fate = fate
  end
end

xlsx.sheet("EnchantRace").each do |row|
  type,name,body,mind,speed,tech,rule,fate = row
  next if type != "EnchantRace"

  Card.seed do |s|
    s.id = id
    s.type = type
    s.name = name
    s.body = body
    s.mind = mind
    s.speed = speed
    s.tech = tech
    s.rule = rule
    s.fate = fate
  end
end
