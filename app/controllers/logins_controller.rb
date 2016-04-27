class LoginsController < ApplicationController
  def new
    @players = Player.all
  end

  def create
    session[:player_id] = params[:player_id]
    session.delete(:pc_id)
    redirect_to :menus_top
  end

  def select
    session[:player_id] = params[:player_id]
    redirect_to :menus_top
  end

  def destroy
    session.delete(:player_id)
    session.delete(:pc_id)
    redirect_to :title
  end
end
