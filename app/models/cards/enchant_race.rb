class EnchantRace < Card
  def name_with_ability
    "#{name}(肉体#{body}/精神#{mind}/速度#{speed}/技術#{tech}/支配#{rule}/運命#{fate})"
  end
end
