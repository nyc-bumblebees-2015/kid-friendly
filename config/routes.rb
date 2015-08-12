Rails.application.routes.draw do
  mount Dashing::Engine, at: Dashing.config.engine_path
  root 'locations#index'

  resources :locations do
    resources :reviews
  end

  resources :reviews, only: [:show] do
    resources :likes, only: [:create]
  end

  resources :users

  get 'signup' => 'users#new'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#logout'

  get 'locations/search/:name' => 'locations#search', as: 'locations_search'
  get 'search_amenities' => 'locations#search_amenities'
  get 'find_amenities/:amenity' => 'locations#find_amenities', as: 'find_amenities'
  get 'report_amenities' => 'locations#report_amenities'
  get 'submission' => 'locations#submission'
end
