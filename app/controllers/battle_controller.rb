class BattleController < RequirePlayerController

  def show

    if player.menu.monsters.empty?
      Log.create(message:"戦闘に勝利した")

    elsif player.pcs.active.empty?
      Log.create(message: "全滅した")
      player.update(menu_id: 14, battle: nil)

    else
      pc = player.pcs.active.first
      monster = Monster.find(params[:monster][:id])
      damage = rand(10)
      if rand < 0.3
        Log.create(message: "#{monster.name}はひらりと身をかわした")
      else
        Log.create(message: "#{pc.name}の攻撃  #{monster.name}に#{damage}ダメージ")
        if monster.hp <= damage
          Log.create(message: "#{monster.name}を倒した。#{monster.exp}経験値を得た。#{monster.gp}ゴールドを得た。")
          pc.gp += monster.gp
          # pc.exp += monster.exp
          monster.delete
        end
      end

      if rand < 0.9
        damage = rand(100)
        Log.create(message: "#{monster.name}の攻撃  #{pc.name}に#{damage}ダメージ")
        pc.damaged(damage)
      end

    end
    redirect_to :logs and return
  end

end
