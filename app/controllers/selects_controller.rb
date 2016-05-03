class SelectsController < ApplicationController
  before_action :check_player, :check_pc

  def new
    @select_form = SelectForm.new(player)
  end

  def show
    redirect_to pc_path(current_pc)
  end


  def create
    session[:pc_id] = params[:select_form][:pc_id]
    redirect_to :game_main
  end

  def destroy
    session.delete(:pc_id)
    redirect_to :game_main
  end

  private
    def check_player
      unless player
        redirect_to :new_login
      end
    end

    def check_pc
      if player.pcs.empty?
        redirect_to :new_pc
      end
    end

end
