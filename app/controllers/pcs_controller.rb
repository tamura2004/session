class PcsController < ApplicationController
  before_action :check_player
  before_action :set_pc, only: [:show, :edit, :update, :destroy]

  # GET /pcs
  def index
    @pcs = Pc.all
  end

  # GET /pcs/1
  def show
  end

  # GET /pcs/new
  def new
    @pc = Pc.create(player_id: current_player.id)
    session[:pc_id] = @pc.id
    redirect_to edit_pc_name_path(@pc)
  end

  # GET /pcs/1/edit
  def edit
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
      params.require(:pc).permit(:gender, :handle, :name)
    end

    def check_player
      unless current_player
        redirect_to :new_login
      end
    end
end
