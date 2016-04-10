class Race < Card
  scope :random_race, -> {
    Template.sample(1).name + Race.sample(1).name
  }

  def name_with_ability
    "#{name}(肉体#{body}/精神#{mind}/速度#{speed}/技術#{tech}/支配#{rule}/運命#{fate})"
  end

end
