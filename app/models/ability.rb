class Ability < ActiveRecord::Base
  after_initialize :set_default_value

  def name
    "【筋力】#{str}　【敏捷】#{dex}　【耐久】#{con}　【知力】#{int}　【判断】#{wis}　【魅力】#{cha}"
  end

  private
  # ６面ダイス
  def d6
    rand(6) + 1
  end

  # ６面ダイスを４個降って、大きい方から３個選んで合計
  def d46
    [d6,d6,d6,d6].sort[1..3].inject(:+)
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
