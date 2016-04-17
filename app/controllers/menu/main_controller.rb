class Menu::MainController < ApplicationController
  before_action :check_player

  def top
  end

  def title
    session.delete(:playter_id)
  end

  def tavern
  end

  def inn
  end

  def trade
  end

  def temple
  end

  def edge
  end

  private

    def check_player
      unless current_player
        redirect_to :new_login
      end
    end

end
