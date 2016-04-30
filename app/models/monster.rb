class Monster < ActiveRecord::Base
  belongs_to :menu

  def label
    "#{name} #{hp}hp"
  end
end
