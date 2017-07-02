Rails.application.routes.draw do

  resources :rooms, only: [:show, :index]
  resources :reservations, except: [:new, :edit]

end
