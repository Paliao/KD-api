Rails.application.routes.draw do
  resources :galeries
  resources :advertises
  resources :carts, only: [:show, :update]
  resources :categories
  resources :contacts
  resources :combos
  resources :days
  resources :establishments
  resources :events
  resources :invites, except: [:index]
  resources :lists
  get 'invites_establishment', to: 'invites#index_establishment'
  resources :parkings
  resources :products
  resources :ratings
  mount_devise_token_auth_for 'User', at: 'auth'
  root :to => 'categories#index'
end
