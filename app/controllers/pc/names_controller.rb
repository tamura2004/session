class Pc::NamesController < ApplicationController
  before_action :set_pc, only: [:edit, :update]

  # GET /pcs/:pc_id/name/edit
  def edit
    @names = GivenName.sample(6).pluck(:name)
  end

  # PATCH/PUT /pcs/:pc_id/name
  def update
    @pc.name = params[:name]

    if @pc.save
      redirect_to :training_top
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
      params.require(:pc).permit(:words)
    end
end
