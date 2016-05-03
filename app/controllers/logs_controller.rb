class LogsController < RequirePlayerController
  def index
    @logs = Log.unread(player.log)
    redirect_to player and return if @logs.empty?
    player.update(log: @logs.last.created_at)
  end
end
