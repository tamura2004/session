class RaceForm
  include ActiveModel::Model
  attr_accessor :race_id, :races

  class Pile
    def initialize
      @race = [EnchantRace.choose,Race.choose]
    end

    %w(body mind speed tech rule fate).each do |abi|
      class_eval("def #{abi};@race.map(&:#{abi}).inject(:+);end")
    end

    def value
      @race.map(&:id).join("|")
    end

    def label
      @race.map(&:name).join
    end
  end

  def initialize
    @races = 6.times.map{Pile.new}
  end
end

# <span class="radio">
# <label for="pc_race_4124">
# <input class="radio_buttons optional" type="radio" value="41|24" name="pc[race]" id="pc_race_4124" />皇帝ジャイアント
# </label>
# </span>
