Rails.application.routes.draw do

  resource :gender, only: [:new, :create]
  resources :pcs do
    # resource :handle, only: [:edit, :update]
    resource :name, only: [:edit, :update]
    resource :race, only: [:edit, :update]
    resources :skills, only: [:new, :create]
  end

end
