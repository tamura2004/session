 class PcsController < ApplicationController
  before_action :check_player
  before_action :set_pc, except: [:index, :new ]

  # GET /pcs
  def index
    @pcs = Pc.all
  end

  # GET /pcs/1
  def show
  end

  # GET /pcs/new
  def new
    @pc = Pc.create
    redirect_to edit_pc_ability_path(@pc)
  end

  # GET /pcs/1/edit
  def edit
    session[:redirect_to] = :pcs
  end

  def edit_ability
    session[:redirect_to] = edit_pc_race_path(@pc)
    @pcs = 6.times.map do
      Pc.find(params[:id]).tap do |pc|
        pc.str = d46
        pc.dex = d46
        pc.con = d46
        pc.int = d46
        pc.wis = d46
        pc.cha = d46
      end
    end
  end

  def edit_race
    session[:redirect_to] = edit_pc_klass_path(@pc)
    @pcs = 6.times.map do |i|
      @pc.dup.tap do |pc|
        case i
        when 0
          pc.size = "中型"
          pc.race = "エルフ"
          pc.alignment = %w(混沌にして善 混沌にして中立 真なる中立 中立にして善).sample
          pc.speed = "30"
          pc.dex += 2
          pc.skill = "トランス"
          pc.sense = "暗視/鋭敏感覚"
        when 1
          pc.size = "中型"
          pc.race = "ハイ・エルフ"
          pc.alignment = %w(混沌にして善 混沌にして中立 真なる中立 中立にして善).sample
          pc.speed = "30"
          pc.int += 1
          pc.skill = "トランス/エルフ流武器訓練/初級呪文"
          pc.sense = "暗視/鋭敏感覚"
        when 2
          pc.size = "中型"
          pc.race = "ドワーフ"
          pc.alignment = %w(秩序して善 秩序にして中立).sample
          pc.speed = "25"
          pc.con += 2
          pc.skill = "石工の勘/道具習熟/ドワーフ流武器訓練"
          pc.sense = "暗視"
          pc.damage_vulnerability = "ドワーフの毒耐性"
        when 3
          pc.size = "中型"
          pc.race = "マウンテン・ドワーフ"
          pc.alignment = %w(秩序して善 秩序にして中立).sample
          pc.speed = "25"
          pc.str += 2
          pc.skill = "石工の勘/道具習熟/ドワーフ流武器訓練/防具訓練"
          pc.sense = "暗視"
          pc.damage_vulnerability = "ドワーフの毒耐性"
        when 4
          pc.size = "小型"
          pc.race = "ハーフリング"
          pc.alignment = "秩序して善"
          pc.speed = "25"
          pc.dex += 2
          pc.skill = "ハーフリングの勇気/ハーフリングの幸運/すり抜け移動"
        when 5
          pc.size = "中型"
          pc.race = "ヒューマン"
          pc.alignment = %w(秩序して善 秩序にして中立 混沌にして善 混沌にして中立 真なる中立).sample
          pc.speed = "30"
          pc.str += 1
          pc.dex += 1
          pc.con += 1
          pc.int += 1
          pc.wis += 1
          pc.cha += 1
        end
      end
    end
  end

  def edit_klass
    session[:redirect_to] = edit_pc_name_path(@pc)
    @pcs = 4.times.map do |i|
      @pc.dup.tap do |pc|
        case i
        when 0
          pc.klass = "ファイター"
          pc.hp = 10 + hp_bonus
          pc.gp = d(5,4) * 10
        when 1
          pc.klass = "ウィザード"
          pc.hp = 6 + hp_bonus
          pc.gp = d(4,4) * 10
        when 2
          pc.klass = "クレリック"
          pc.hp = 8 + hp_bonus
          pc.gp = d(5,4) * 10
        when 3
          pc.klass = "ローグ"
          pc.hp = 8 + hp_bonus
          pc.gp = d(4,4) * 10
        end
      end
    end
  end

  def edit_name
    @pcs = GivenName.sample(6).pluck(:name).each do |name|
      @pc.dup.tap do |pc|
        pc.name = name
      end
    end
  end

  # PATCH/PUT /pcs/1
  # PATCH/PUT /pcs/1.json
  def update
    if @pc.update(pc_params)
      redirect_to(session.delete(:redirect_to) || :training_top)
    else
      redirect_to :back
    end
  end

  # DELETE /pcs/1
  def destroy
    @pc.destroy
    respond_to do |format|
      format.html { redirect_to pcs_url, notice: 'Pc was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pc
      @pc = Pc.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pc_params
      params.require(:pc).permit!
    end

    def check_player
      unless current_player
        redirect_to :new_login
      end
    end

    # ６面ダイス
    def d6
      rand(6) + 1
    end

    # ６面ダイスを４個降って、大きい方から３個選んで合計
    def d46
      [d6,d6,d6,d6].sort[1..3].inject(:+)
    end

    def d(n,m)
      n.times.map{rand(m)+1}.inject(:+)
    end

end
