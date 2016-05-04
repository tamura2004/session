class Pc < Character
  belongs_to :player
  belongs_to :alignment
  has_many :equipments
  after_initialize :set_default_value
  after_update :check_state

  scope :active, -> { where.not(state: "死亡") }
  scope :solo, -> { where(player: nil) }

  def label
    "【名前】%-6s 【所持金】%3d 【hp】%3d 【状態】%s<br>【筋】%2d　【敏】%2d　【耐】%2d　【知】%2d　【判】%2d　【魅】%2d" % [name,gp,hp,state,str,dex,con,int,wis,cha]
    # "【名前】%-6s 【所持金】%3d" % [name,gp,str,dex,con,int,wis,cha]
  end

  def damaged(damage)
    self.hp -= damage
    save
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

    self.hp ||= con * 3

    self.gp ||= ((-Math.log(rand)*30).to_i)*10
    self.level ||= 1
    self.speed ||= 30
    self.name ||= GivenName.choose.name
    self.alignment ||= Alignment.choose
    self.state ||= :ok
  end

  def check_state
    if hp < 0
      update(hp: 0, state: "死亡")
      Log.create(message: "#{name}は死んだ")
    end
  end

end
