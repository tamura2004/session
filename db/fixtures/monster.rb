10.times do |i|
  menu = Menu.find_by(name:"地下#{i}層")

  i.times do
    Monster.seed do |s|
      s.name = "スライム"
      s.menu_id = menu.id
      s.hit = 5
      s.escape = 5
      s.damage = 1
      s.defence = 1
      s.hp = 1
      s.gp = 10
      s.exp = 100
    end
  end
end


