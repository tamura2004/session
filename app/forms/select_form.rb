class SelectForm
  include ActiveModel::Model
  attr_accessor :pc_id, :pcs

  def initialize(player)
    @pcs = Pc.where(player_id: player.id)
  end
end
