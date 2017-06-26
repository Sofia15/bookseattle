Rails.application.routes.draw do

  resources :locations, except: [:new, :edit]
  resources :rooms, except: [:new, :edit]

end
