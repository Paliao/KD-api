Rails.application.routes.draw do
  resources :contacts
  resources :events
  resources :categories
  resources :combos
  resources :products
  resources :ratings
  resources :advertises
  resources :days
  resources :establishments
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
