Rails.application.routes.draw do

  namespace :pc do
  get 'abilities/edit'
  end

  namespace :pc do
  get 'abilities/update'
  end

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

  resource :select, only: [:show, :new, :create, :destroy]
  resource :login, only:  [:new, :create, :destroy]

  resources :pcs do
    %w(name ability race klass).each do |attr|
      resource attr.to_sym, only: [:edit, :update], controller: "pc/#{attr.pluralize}"
    end
    # resource :ability, only: [:edit, :update], controller: "pc/ability"
    # resource :name, only: [:edit, :update],
    # resource :race, only: [:edit, :update]
    # resource :klass, only: [:edit, :update]
  end

end
