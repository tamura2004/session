class Pc < ActiveRecord::Base
  include SampleScopes

  belongs_to :player
  belongs_to :alignment
  has_many :equipments
  after_initialize :set_default_value
  after_save :check_state

  scope :active, -> { where.not(state: "死亡") }
  scope :solo, -> { where(player: nil) }

  def label
    "【名前】%-6s 【所持金】%3d 【hp】%3d 【状態】%s<br>【筋】%2d　【敏】%2d　【耐】%2d　【知】%2d　【判】%2d　【魅】%2d" % [name,gp,hp,state,str,dex,con,int,wis,cha]
    # "【名前】%-6s 【所持金】%3d" % [name,gp,str,dex,con,int,wis,cha]
  end

  def attack(equipment, monster)
    Log.info("#{name}が#{equipment.name}で#{monster.name}を攻撃")

    if true
      monster.damaged(rand(str))
    else
      Log.info("#{monster.name}はひらりと身をかわした")
    end
  end

  def damaged(damage)
    Log.info("#{name}に#{damage}ダメージ")
    update(hp: hp - damage)
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
    self.name ||= GivenName.choose.name
    self.state ||= "正常"
  end

  def check_state
    if hp < 0
      update(hp: 0, state: "死亡")
      Log.create(message: "#{name}は死んだ")
    end
  end

end
