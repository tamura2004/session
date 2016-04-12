class LoginForm
  include ActiveModel::Model
  attr_accessor :player_id, :players

  def initialize
    @players = Player.all
  end
end
