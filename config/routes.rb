Rails.application.routes.draw do
  resources :advertises
  resources :categories
  resources :combos
  resources :contacts
  resources :days
  resources :establishments
  resources :events
  resources :invites, except: [:index]
  get 'invites_establishment', to: 'invites#index_establishment'
  resources :parkings
  resources :products
  resources :ratings
  mount_devise_token_auth_for 'User', at: 'auth'
  root :to => 'categories#index'
end
