Rails.application.routes.draw do
  root "artists#index"

  resources :artists, only: %i[index show] do
    resources :writings, only: %i[index edit update] do
      get :search, on: :collection
      resources :tags, only: %i[create destroy], controller: "tags"
      resources :annotations, only: %i[index new create edit update], controller: "annotations"
    end
  end

  namespace :authentication do
    resource :registration, only: %i[new create]
    resource :session, only: %i[new create destroy]
    resource :password_reset, only: %i[new create edit update]
    resource :password, only: %i[edit update]
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
