Rails.application.routes.draw do
  devise_for :users
  resources :reservations
  resources :restaurants, path: '/'

end
