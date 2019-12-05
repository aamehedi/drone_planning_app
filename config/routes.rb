Rails.application.routes.draw do
  resources :drones
  resources :pilots
  resources :missions
  root to: 'pilots#index'
end
