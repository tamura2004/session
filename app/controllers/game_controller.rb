class GameController < ApplicationController
  before_action :check_player, :check_pc

  def main
    @battle_form = BattleForm.new(current_encounter)
  end

  def start
  end

  def over
  end

  def logout
    session.delete(:playet_id)
    session.delete(:pc_id)
    redirect_to :new_login
  end

  def create
    monster = EncountersMonster.find(params[:battle_form][:monster_id])
    monster.hp -= 5
    monster.save

    puts "-"*200
    puts current_encounter.memo
    memo = current_encounter.memo = "ダメージ"
    current_encounter.update(memo: memo + "\nhoge")
    puts current_encounter.memo
    # action = params[:battle_form][:action]
    # monster = EncountersMonster.find(params[:battle_form][:monster_id])
    # case action
    # when 1
    #   damage = rand(20)
    #   monster.hp -= damage
    #   damaged = rand(5)
    #   current_encounter.memo += "<br>#{monster.monster.name + monster.label}を攻撃。#{damage}ダメージ"
    #   current_encounter.memo += "<br>#{monster.monster.name + monster.label}の反撃。#{damaged}ダメージ"
    # when 2
    #   heal = rand(20)
    #   current_encounter.memo += "<br>#{monster.monster.name + monster.label}を#{heal}点回復"
    # when 3
    #   current_encounter.memo += "<br>あなたは逃げ出した"
    # end
    # current_encounter.save
    redirect_to :game_main
  end

  private

    def check_player
      unless current_player
        redirect_to :new_login
      end
    end

    def check_pc
      if current_player.pcs.empty?
        redirect_to :new_pc
      elsif !current_pc
        redirect_to :new_select
      end
    end

end
