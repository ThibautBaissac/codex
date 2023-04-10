Rails.application.routes.draw do
  root to: "works#index"
  get :search, to: "application#search"
  resources :works
  resources :mouvements
  resources :quotes
  resources :sessions, only: [:new, :create, :destroy]
  get '/signout', to: 'sessions#destroy', as: :signout
end
