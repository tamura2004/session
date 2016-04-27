class AbilitiesController < ApplicationController

  def create
    @ability = Ability.new(ability_params)

    if @ability.save
      redirect_to session.delete(:redirect_to)
    else
      render :new
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def ability_params
      params.require(:ability).permit!
    end
end
