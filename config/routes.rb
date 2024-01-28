Rails.application.routes.draw do
  namespace :admin do
    resources :annotations
    resources :artists
    resources :tags
    resources :taggings
    resources :users
    resources :writings
    resources :artist_editors
    resources :sources
    resources :writing_sources

    root to: "annotations#index"
  end
  root "artists#index"

  resources :artists, only: %i[index show edit update] do
    resources :sources
    resources :writings, only: %i[index new create edit update] do
      get :search, on: :collection
      resources :tags, only: %i[create destroy], controller: "tags"
      resources :annotations, only: %i[index new create edit update], controller: "annotations"
    end
  end

  namespace :administration do
    resources :annotations, only: %i[index edit update]
  end

  namespace :authentication do
    resource :registration, only: %i[new create]
    resource :session, only: %i[new create destroy]
    resource :password_reset, only: %i[new create edit update]
    resource :password, only: %i[edit update]
  end

  resources :users, only: %i[show edit update]
  resources :statistics, only: %i[index] do
    collection do
      get :greif_writings_by_year_chart
      get :tags_by_name_chart
    end
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
