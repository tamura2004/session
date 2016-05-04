class Log < ActiveRecord::Base
  scope :unread, ->(time){ where("created_at > ?", time) }

  def label
    message
  end

  scope :info, ->(str){ create(message: str) }

end
