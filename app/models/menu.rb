class Menu < ActiveRecord::Base
  belongs_to :parent, class_name: "Menu", foreign_key: "menu_id"
  has_many :children, class_name: "Menu", foreign_key: "menu_id"

  def choices
    case name
    when "能力値を選択"
      6.times.map{Ability.new}
    when "名前を選択"
      GivenName.sample(6)
    else
      nil
    end
  end

end
