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
    @abilities = 6.times.map do
      Ability.new(pc: @pc)
    end
  end

  def edit_race
    session[:redirect_to] = edit_pc_klass_path(@pc)
    @pcs = 6.times.map do |i|
      get_pc.tap do |pc|
      end
    end
  end

  def edit_klass
    session[:redirect_to] = edit_pc_name_path(@pc)
    @pcs = 4.times.map do |i|
      get_pc.tap do |pc|
        case i
        when 0
          pc.klass = "ファイター"
          pc.hp = 10 + pc.hp_bonus
          pc.gp = d(5,4) * 10
        when 1
          pc.klass = "ウィザード"
          pc.hp = 6 + pc.hp_bonus
          pc.gp = d(4,4) * 10
        when 2
          pc.klass = "クレリック"
          pc.hp = 8 + pc.hp_bonus
          pc.gp = d(5,4) * 10
        when 3
          pc.klass = "ローグ"
          pc.hp = 8 + pc.hp_bonus
          pc.gp = d(4,4) * 10
        end
      end
    end
  end

  def edit_name
    @pcs = GivenName.sample(6).pluck(:name).map do |name|
      get_pc.tap do |pc|
        pc.name = name
      end
    end
  end

  def edit_party
    @pcs = Pc.where(party_id: nil).tap do |pc|
      pc.party_id = current_player.party.id
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

    def get_pc
      Pc.find(params[:id])
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
