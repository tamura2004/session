class CurrentPcsController < ApplicationController
  def edit
    @player = current_player
    @pc = Pc.all
  end

  def update
  end
end
