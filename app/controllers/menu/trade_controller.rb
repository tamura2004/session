class Menu::TradeController < Menu::MainController
  def top
    @pcs = Pc.all
  end
end
