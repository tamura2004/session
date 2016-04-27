
items = <<EOD
ダガー,2
メイス,5
バトルアックス,10
ロングソード,15
グレートアックス,30
グレートソード,50
ショートボウ,25
ヘヴィ・クロスボウ,50
EOD

items.split(/\n/).each do |line|
  name,gp = line.split(/,/)
  Item.seed do |s|
    s.name = name
    s.gp = gp
  end
end
