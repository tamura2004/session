class Pc < Character
  belongs_to :party
  has_many :equipments
  after_initialize :set_default_value
  after_update :check_state

  def label
    "【名前】%-6s 【所持金】%3d 【hp】%3d <br>【筋】%2d　【敏】%2d　【耐】%2d　【知】%2d　【判】%2d　【魅】%2d" % [name,gp,hp,str,dex,con,int,wis,cha]
    # "【名前】%-6s 【所持金】%3d" % [name,gp,str,dex,con,int,wis,cha]
  end

  private
  # ６面ダイス
  def d6
    rand(6) + 1
  end

  # ６面ダイスを４個降って、大きい方から３個選んで合計
  def d46
    # [d6,d6,d6,d6].sort.last(3).inject(:+)
    -Math.log(rand)*5+7
  end

  def set_default_value
    self.str ||= d46
    self.dex ||= d46
    self.con ||= d46
    self.int ||= d46
    self.wis ||= d46
    self.cha ||= d46

    self.hp ||= con * (-Math.log(rand))

    self.gp ||= ((-Math.log(rand)*30).to_i)*10
    self.name ||= GivenName.choose.name
    self.state ||= :ok
  end

  def check_state
    if hp < 0
      self.hp = 0
      self.state = :dead
      save
    end
  end

end
