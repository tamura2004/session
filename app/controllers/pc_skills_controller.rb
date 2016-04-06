class PcSkillsController < ApplicationController
  def create
    @pc = Pc.find(params[:pc_id])
    @pc_skill = @pc.pc_skills.create(params.require(:pc_skill).permit(:skill_id))
    if @pc.pc_skills.size < 6
      redirect_to pc_path(@pc)
    else
      redirect_to pcs_path
    end
  end
end
