class SkillsController < ApplicationController
  before_action :set_pc, only: [:new, :create]

  # GET /pcs/:pc_id/gender/new
  def new
    @skill = @pc.skills.build
  end

  # POST /pcs/:pc_id/gender
  def create
    @pc.skills.create(pc_skill_params)
    if @pc.save
      if @pc.skills.size < SKILLS_NUM
        redirect_to new_pc_skill_path(@pc)
      else
        redirect_to @pc
      end
    else
      render :new
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pc
      @pc = Pc.find(params[:pc_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pc_skill_params
      params.require(:pc_skill).permit(:skill_id)
    end


end
