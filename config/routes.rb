Rails.application.routes.draw do
  root to: "rooms#index"

  resources :rooms, only: [:show, :index]
  resources :reservations, only: [:show, :create]
  get '/health', to: 'application#health'


end
