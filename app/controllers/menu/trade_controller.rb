class Menu::TradeController < ApplicationController
  def top
    @pcs = Pc.all
  end
end
