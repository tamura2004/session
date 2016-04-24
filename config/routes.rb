Rails.application.routes.draw do
  root "menus#top"

  get 'dungeon/up'
  get 'dungeon/down'
  get 'temple/raise_dead'
  get 'temple/reserrection'
  get 'temple/cure_paralysis'
  get 'temple/neutralize_poison'
  get 'temple/remove_curse'
  get 'temple/turn_to_fresh'
  get 'battle/weapon'
  get 'battle/spell'
  get 'battle/item'
  get 'battle/defence'
  get 'battle/escape'
  get 'menus/top'

  resources :menus, only: [:index, :show]

  # MENUS = {
  #   title: %w(top),
  #   main: %w(top restart),
  #   tavern: %w(top add exit remove share stat),
  #   inn: %w(top economy horse royal select simple sweet),
  #   trade: %w(top buy dispel gold identify sell),
  #   temple: %w(top),
  #   edge: %w(top restart),
  #   training: %w(top),
  #   maze: %w(top up down),
  #   camp: %w(top abort exit reorder search stat),
  # }

  # MENUS.each do |controller,actions|
  #   actions.each do |action|
  #     get "menu/#{controller}/#{action}", as: "#{controller}_#{action}"
  #   end
  # end

  resource :select, only: [:show, :new, :create, :destroy]
  resource :login, only:  [:new, :create, :destroy]

  resources :pcs

  %w(name ability race klass).each do |attr|
    get "pcs/:id/#{attr}/edit", as: "edit_pc_#{attr}", controller: "pcs", action: "edit_#{attr}"
  end

  get "pcs/party/edit", as: "edit_pc_party", controller: "pcs", action: "edit_party"

end
