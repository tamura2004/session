class LoginsController < ApplicationController
  def new
    @players = Player.all
  end

  def create
    id = session[:player_id] = params[:form][:id]
    player = Player.find(id)
    redirect_to player
  end

end
