Rails.application.routes.draw do
  resources :sample
  resources :animals
  root    to: "animals#index"
end
