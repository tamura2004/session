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
