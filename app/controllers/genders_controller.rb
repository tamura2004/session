class GendersController < ApplicationController

  # GET /pcs/:pc_id/gender/new
  def new
    @pc = Pc.new
  end

  # POST /pcs/:pc_id/gender
  def create
    @pc = Pc.new(pc_params)
    if @pc.save
      redirect_to edit_pc_name_path(@pc)
    else
      render :new
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def pc_params
      params.require(:pc).permit(:gender)
    end

end
