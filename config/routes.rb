Rails.application.routes.draw do
  resources :pcs do
    resources :pc_skills
  end

end
