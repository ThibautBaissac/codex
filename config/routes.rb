Rails.application.routes.draw do
  root to: "static_pages#index"
  get :search, to: "application#search"
  resources :works do
    post :add_selected_element, on: :member
    post :remove_selected_element, on: :member
    resources :mouvements do
      post :add_selected_element, on: :member
      post :remove_selected_element, on: :member
    end
  end
  resources :elements
  resources :metrics, only: %i[index]
  resources :concerts
  resources :static_pages, only: %i[index]
  resources :sessions, only: %i[new create destroy]
  get '/signout', to: 'sessions#destroy', as: :signout
end
