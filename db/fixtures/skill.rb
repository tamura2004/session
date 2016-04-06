SKILLS = {
  "武器" => [
    "ダガー",
    "ロングソード",
    "ツヴァイハンダー",
    "三日月斧",
    "タワーシールド"
  ],
  "鎧" => [
    "旅人の服",
    "レザーアーマー",
    "チェインメイル",
    "フルプレート"
  ]
}

id = 0
SKILLS.each do |type,v|
  v.each do |name|
    Skill.seed do |s|
      s.id = id
      s.type = type
      s.name = name
    end
    id += 1
  end
end

