Rails.application.routes.draw do
  resources :invites
  resources :advertises
  resources :categories
  resources :combos
  resources :contacts
  resources :days
  resources :establishments
  resources :events
  resources :parkings
  resources :products
  resources :ratings
  mount_devise_token_auth_for 'User', at: 'auth'
  root :to => 'categories#index'
end
