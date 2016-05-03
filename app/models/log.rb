class Log < ActiveRecord::Base
  scope :unread, ->(time){ where("created_at > ?", time) }

  def label
    message
  end

end
