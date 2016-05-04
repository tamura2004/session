Rails.application.routes.draw do

  root "menus#top"
  get 'menus/top'

  resource :login, only:  [:new, :create, :destroy]
  resources :menus
  resources :pcs
  resources :players
  resources :logs, only: [:index]
  resources :battles

end
