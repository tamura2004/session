Rails.application.routes.draw do

  get 'game/main'
  get 'game/start'
  get 'game/over'
  get "game/select"
  get "game/logout"
  post "game/create"

  resources :monsters
  resources :scinarios
  resources :encounters
  resources :players

  resource :login, only: [:new,:create,:destroy]
  resource :select, only: [:new,:create,:destroy]

  resources :pcs do
    resource :name, only: [:edit, :update]
    resource :race, only: [:edit, :update]
    resources :klasses, only: [:new, :create]
    resources :skills, only: [:new, :create]
    resources :action, only: [:new,:create]
  end

end
