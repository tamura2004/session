class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  HANDLES_NUM = 6
  NAMES_NUM = 6
  SKILLS_NUM = 6

  private

  def current_player
    if session[:player_id]
      @current_player ||= Player.find(session[:player_id])
    end
  end

  def current_player_name
    if current_player
      current_player.name
    else
      "ログイン"
    end
  end

  def current_pc
    if session[:pc_id]
      @current_pc ||= Pc.find(session[:pc_id])
    end
  end

  def current_pc_name
    if current_pc
      current_pc.full_name
    else
      "PC選択"
    end
  end

  def current_encounter
    Game.first.instance_eval do
      if nil?
        Game.create(encounter_id: 0).encounter
      else
        encounter
      end
    end
  end

  helper_method :current_player
  helper_method :current_pc
  helper_method :current_player_name
  helper_method :current_pc_name
  helper_method :current_encounter
end
