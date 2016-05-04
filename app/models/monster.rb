class Monster < ActiveRecord::Base
  belongs_to :menu
  after_save :check_state

  def label
    "#{name} #{hp}hp"
  end

  def form_params
    key = model_name.param_key
    value = attributes.compact.except("created_at","updated_at")
    Hash[key,value]
  end

  def attack(pc)
    Log.info("#{name}は#{pc.name}を攻撃")
    if rand < 0.3
      pc.damaged(rand(50))
    else
      Log.info("#{pc.name}はひらりと身をかわした")
    end
  end

  def damaged(damage)
    Log.info("#{name}に#{damage}ダメージ")
    update(hp: hp - damage)
  end

  private

    def check_state
      if hp < 0
        Log.info("#{name}を倒した")
        delete
      end
    end

end
