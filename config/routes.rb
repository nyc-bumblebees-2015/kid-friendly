Rails.application.routes.draw do
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
  get 'find_amenities/:amenity' => 'locations#find_amenities', as: 'find_amenities'
  get 'report_amenities' => 'locations#report_amenities'
end
