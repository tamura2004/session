class Pc::KlassesController < ApplicationController
  before_action :set_pc, only: [:edit, :update]

  def edit
    @klasses = %w(ファイター ウィザード クレリック ローグ)
  end

  def update
    @pc.klass = params[:klass]
    hp_bonus = (@pc.con - 10) / 2
    case @pc.klass
    when /ファイター/
      @pc.hp = 10 + hp_bonus
      @pc.gp = d(5,4) * 10
    when /ウィザード/
      @pc.hp = 6 + hp_bonus
      @pc.gp = d(4,4) * 10
    when /クレリック/
      @pc.hp = 8 + hp_bonus
      @pc.gp = d(5,4) * 10
    when /ローグ/
      @pc.hp = 8 + hp_bonus
      @pc.gp = d(4,4) * 10
    end


    if @pc.save
      redirect_to edit_pc_name_path(@pc)
    else
      render :edit
    end
  end

  private
    def d(n,m)
      n.times.map{rand(m)+1}.inject(:+)
    end

    def pc_id
      params[:pc_id]
    end

    def set_pc
      @pc = Pc.find(params[:pc_id])
    end

    def klass_params
      params.require(:pc_klass).permit(:klass_id)
    end
end
