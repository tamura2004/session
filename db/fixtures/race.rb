Race.seed do |s|
     s.name = "エルフ"
     s.size = "中型"
     s.speed = "30"
     s.dex = 2
     s.skill = "トランス"
     s.sense = "暗視/鋭敏感覚"
end

Race.seed do |s|
     s.name = "ハイ・エルフ"
     s.size = "中型"
     s.speed = "30"
     s.int = 1
     s.skill = "トランス/エルフ流武器訓練/初級呪文"
     s.sense = "暗視/鋭敏感覚"
end

Race.seed do |s|
     s.name = "ドワーフ"
     s.size = "中型"
     s.speed = "25"
     s.con = 2
     s.skill = "石工の勘/道具習熟/ドワーフ流武器訓練"
     s.sense = "暗視"
     s.damage_vulnerability = "ドワーフの毒耐性"
end

Race.seed do |s|
     s.name = "マウンテン・ドワーフ"
     s.size = "中型"
     s.speed = "25"
     s.str = 2
     s.skill = "石工の勘/道具習熟/ドワーフ流武器訓練/防具訓練"
     s.sense = "暗視"
     s.damage_vulnerability = "ドワーフの毒耐性"
end

Race.seed do |s|
     s.name = "ハーフリング"
     s.size = "小型"
     s.speed = "25"
     s.dex = 2
     s.skill = "ハーフリングの勇気/ハーフリングの幸運/すり抜け移動"
end

Race.seed do |s|
     s.name = "ヒューマン"
     s.size = "中型"
     s.speed = "30"
     s.str = 1
     s.dex = 1
     s.con = 1
     s.int = 1
     s.wis = 1
     s.cha = 1
end