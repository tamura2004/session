class Menu::TitleController < ApplicationController
  def top
    session.delete(:player_id)
  end
end
