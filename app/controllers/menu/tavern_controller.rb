class Menu::TavernController < Menu::MainController
  def add
    @pcs = Pc.noparty
    @party = current_player.parties.find_or_create_by(area: "town")
  end

  def remove
    @party = current_player.parties.find_or_create_by(area: "town")
    @pcs = Pc.where(party_id: @party.id)
  end

  def stat
  end

  def share
  end

  def exit
  end
end
