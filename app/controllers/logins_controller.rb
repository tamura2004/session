class LoginsController < ApplicationController
  def new
    @login_form = LoginForm.new
  end

  def create
    session[:player_id] = params[:login_form][:player_id]
    session.delete(:pc_id)
    redirect_to :game_main
  end

  def destroy
    session.delete(:player_id)
    redirect_to :game_main
  end
end
