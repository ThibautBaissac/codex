Rails.application.routes.draw do
  root to: "works#index"
  get :search, to: "application#search"
  resources :works do
    resources :mouvements do
      post :add_selected_element, on: :member
    end
  end
  resources :elements
  resources :metrics, only: %i[index]
  resources :sessions, only: %i[new create destroy]
  get '/signout', to: 'sessions#destroy', as: :signout
end
