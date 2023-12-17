Rails.application.routes.draw do
  root "artists#index"
  get 'artists/index'

  resources :artists do
    resources :writings do
      get :search, on: :collection
      resources :tags, only: %i[create destroy], controller: 'tags'
    end
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
