Rails.application.routes.draw do

  root "menu/title#top"

  MENUS = {
    title: %w(top),
    main: %w(top restart),
    tavern: %w(top add exit remove share stat),
    inn: %w(top economy horse royal select simple sweet),
    trade: %w(top buy dispel gold identify sell),
    temple: %w(top),
    edge: %w(top restart),
    training: %w(top),
    maze: %w(top up down),
    camp: %w(top abort exit reorder search stat),
  }

  MENUS.each do |controller,actions|
    actions.each do |action|
      get "menu/#{controller}/#{action}", as: "#{controller}_#{action}"
    end
  end

  post "game/create"
  resources :monsters
  resources :scinarios
  resources :encounters
  resources :players
  resource :select, only: [:show, :new, :create, :destroy]
  resource :login, only:  [:new, :create, :destroy]
  resources :pcs do
    resource :name, only: [:edit, :update]
    resource :race, only: [:edit, :update]
    resources :klasses, only: [:new, :create]
    resources :skills, only: [:new, :create]
    resources :action, only: [:new,:create]
  end

end
