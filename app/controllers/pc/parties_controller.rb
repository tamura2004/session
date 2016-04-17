class Pc::PartiesController < ApplicationController

  def update
    @pc = Pc.find(params[:pc_id])
    @pc.party_id = params[:party_id]
    if @pc.save
      redirect_to :tavern_top
    else
      redirect_to :tavern_add
    end
  end

  def destroy
    @pc = Pc.find(params[:pc_id])
    @pc.party_id = nil
    if @pc.save
      redirect_to :tavern_top
    else
      redirect_to :tavern_remove
    end
  end


end
