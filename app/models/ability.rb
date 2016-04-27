class Ability < ActiveRecord::Base
  belongs_to :pc
  after_initialize :set_default_value

  def name
    "【筋力】%2d　【敏捷】%2d　【耐久】%2d　【知力】%2d　【判断】%2d　【魅力】%2d" % [str,dex,con,int,wis,cha]
  end

  private
  # ６面ダイス
  def d6
    rand(6) + 1
  end

  # ６面ダイスを４個降って、大きい方から３個選んで合計
  def d46
    [d6,d6,d6,d6].sort.last(3).inject(:+)
  end

  def set_default_value
    self.str ||= d46
    self.dex ||= d46
    self.con ||= d46
    self.int ||= d46
    self.wis ||= d46
    self.cha ||= d46
  end

end
