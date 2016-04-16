class Menu::MainController < ApplicationController
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
end
