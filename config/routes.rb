Rails.application.routes.draw do
  root to: "rooms#index"

  resources :rooms, only: [:show, :index]
  resources :reservations, except: [:new, :edit]
  get '/health', to: 'application#health'


end
