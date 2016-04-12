Scinario.seed do |s|
  s.id = 0
  s.name = "チュートリアル山賊団"
  s.memo = "山賊に誘拐された村長の娘を救い出せ！"
end

Encounter.seed do |s|
  s.id = 0
  s.scinario_id = 0
  s.name = "入り口の見張り"
  s.memo = "山賊のアジトの入り口には見張りが３名"
end

Monster.seed do |s|
  s.id = 0
  s.name = "盗賊"
  s.hp = 20
end

EncountersMonster.seed do |s|
  s.id = 0
  s.label = "A"
  s.hp = 10
  s.monster_id = 0
  s.encounter_id = 0
end

EncountersMonster.seed do |s|
  s.id = 1
  s.label = "B"
  s.hp = 9
  s.monster_id = 0
  s.encounter_id = 0
end

EncountersMonster.seed do |s|
  s.id = 2
  s.label = "C"
  s.hp = 12
  s.monster_id = 0
  s.encounter_id = 0
end

Game.seed do |s|
  s.id = 0
  s.encounter_id = 0
end
