Rails.application.routes.draw do
  resources :reservations
  resources :restaurants, path: '/'

end
