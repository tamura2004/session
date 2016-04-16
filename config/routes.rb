Rails.application.routes.draw do
  root "menu#top"
  # get "game/select"
  get 'camp/abort'
  get 'camp/exit'
  get 'camp/reorder'
  get 'camp/search'
  get 'camp/stat'
  get 'camp/top'

  get 'game/main'
  get 'game/over'
  get 'game/start'

  get 'inn/economy'
  get 'inn/horse'
  get 'inn/royal'
  get 'inn/select'
  get 'inn/simple'
  get 'inn/sweet'

  get 'maze/down'
  get 'maze/top'
  get 'maze/up'

  get 'menu/edge'
  get 'menu/inn'
  get 'menu/restart'
  get 'menu/tavern'
  get 'menu/temple'
  get 'menu/top'
  get 'menu/title'
  get 'menu/trade'

  get 'tavern/add'
  get 'tavern/exit'
  get 'tavern/remove'
  get 'tavern/share'
  get 'tavern/stat'
  get 'trade/buy'
  get 'trade/dispel'
  get 'trade/gold'
  get 'trade/identify'
  get 'trade/sell'
  get 'training/top'
  # get "game/logout"
  post "game/create"
  resources :monsters
  resources :scinarios
  resources :encounters
  resources :players
  resource :login, only: [:new,:create,:destroy]
  resource :select, only: [:show, :new, :create, :destroy]
  resources :pcs do
    resource :name, only: [:edit, :update]
    resource :race, only: [:edit, :update]
    resources :klasses, only: [:new, :create]
    resources :skills, only: [:new, :create]
    resources :action, only: [:new,:create]
  end
end
