class Menu < ActiveRecord::Base
  belongs_to :parent, class_name: "Menu", foreign_key: "menu_id"
  has_many :children, class_name: "Menu", foreign_key: "menu_id"
  has_many :monsters

  scope :by_name, ->(name){ find_by(name: name) }
end
