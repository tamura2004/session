class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def player
    if session[:player_id]
      @player ||= Player.find(session[:player_id])
    end
  end

  helper_method :player
end
