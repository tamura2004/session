class RacesController < ApplicationController
  before_action :set_pc, only: [:edit, :update]

  # GET /pcs/:pc_id/name/edit
  def edit
    @race_form = RaceForm.new
  end

  # PATCH/PUT /pcs/:pc_id/name
  def update
    enchant_race_id, race_id = pc_params[:race].split("|")
    @pc.enchant_race_id = enchant_race_id
    @pc.race_id = race_id

    if @pc.save
      redirect_to new_pc_klass_path(@pc)
    else
      render :edit
    end
  end

  private
    def races
      %w(EnchantRace Race).map do |type|
        Card.where(type: type).choose
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_pc
      @pc = Pc.find(params[:pc_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pc_params
      params.require(:pc).permit(:race)
    end
end
