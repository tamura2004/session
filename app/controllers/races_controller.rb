class RacesController < ApplicationController
  before_action :set_pc, only: [:edit, :update]

  # GET /pcs/:pc_id/name/edit
  def edit
    @enchant_races = EnchantRace.sample(6)
    @races = Race.sample(6)
  end

  # PATCH/PUT /pcs/:pc_id/name
  def update
    @pc.enchant_race = EnchantRace.find(pc_params[:enchant_race_id])
    @pc.race = Race.find(pc_params[:race_id])

    if @pc.update(pc_params)
      redirect_to pc_path(@pc)
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pc
      @pc = Pc.find(params[:pc_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pc_params
      params.require(:pc).permit(:enchant_race_id, :race_id)
    end
end
