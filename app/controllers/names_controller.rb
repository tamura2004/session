class NamesController < ApplicationController
  before_action :set_pc, only: [:edit, :update]

  # GET /pcs/:pc_id/name/edit
  def edit
    @handles_before = HandleBefore.sample(3)
    @handles_after = HandleAfter.sample(3)
    @family_names = FamilyName.sample(3)
    if @pc.gender = "male"
      @given_names = GivenName.male.sample(3)
    else
      @given_names = GivenName.female.sample(3)
    end
  end

  # PATCH/PUT /pcs/:pc_id/name
  def update
    if @pc.update(pc_params)
      redirect_to edit_pc_race_path(@pc)
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
      params.require(:pc).permit(:handle_before_id,:handle_after_id,:family_name_id,:given_name_id)
    end
end
