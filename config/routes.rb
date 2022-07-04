Rails.application.routes.draw do

  # Sample
  resources :sample
  resources :animals
  root to: "animals#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
