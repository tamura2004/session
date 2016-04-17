class Pc::RacesController < ApplicationController
  before_action :set_pc, only: [:edit, :update]

  # GET /pcs/:pc_id/name/edit
  def edit
    @races = %w(ヒューマン エルフ ドワーフ ハーフリング)
  end

  # PATCH/PUT /pcs/:pc_id/name
  def update
    @pc.race = params[:race]

    if @pc.save
      redirect_to edit_pc_klass_path(@pc)
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
      params.require(:pc).permit(:race)
    end
end
