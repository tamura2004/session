class HandlesController < ApplicationController
  before_action :set_pc, only: [:edit, :update]

  # GET /pcs/:pc_id/handle/edit
  def edit
    @handles = @pc.handles_candidate(HANDLES_NUM)
  end

  # PATCH/PUT /pcs/:pc_id/handle
  def update
    if @pc.update(pc_params)
      redirect_to edit_pc_name_path(@pc)
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
      params.require(:pc).permit(:handle)
    end
end
