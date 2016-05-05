NAMES = <<EOD
井上
江原
鈴木
白石
高山
田村
津下
木村
EOD

NAMES.split(/\n/).each_with_index do |name,i|
  Player.seed do |s|
    s.id = i
    s.name = name
  end
end
