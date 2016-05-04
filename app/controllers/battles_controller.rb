class BattlesController < RequirePlayerController
  before_action :set_battle, only: [:show, :update]

  def show

    if @battle.pc.nil?
      @title = "攻撃キャラクターを選択"
      @contents = player.pcs

    elsif @battle.equipment.nil?
      @title = "攻撃手段を選択"
      @contents = @battle.pc.equipments

    elsif @battle.monster.nil?
      @title = "攻撃対象を選択"
      @contents = player.menu.monsters

    else
      @battle.attack!
      redirect_to :logs
    end

  end

  def update

    if params[:pc]
      @battle.update(pc_id: params[:pc][:id])

    elsif params[:equipment]
      @battle.update(equipment_id: params[:equipment][:id])

    elsif params[:monster]
      @battle.update(monster_id: params[:monster][:id])
    end

    redirect_to player.battle

  end

  private

    def set_battle
      @battle = Battle.find(params[:id])
    end

end
