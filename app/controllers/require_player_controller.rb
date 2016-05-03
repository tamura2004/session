class RequirePlayerController < ApplicationController
  before_action :check_player, except: [:top]

  private

  def check_player
    unless player
      redirect_to :new_login
      return
    end
  end

end
