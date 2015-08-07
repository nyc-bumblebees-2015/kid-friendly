Rails.application.routes.draw do
  root 'locations#index'

  resources :locations do
    resources :reviews
  end

  resources :likes, only: [:create]

  resources :users

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#delete' 

  get 'find_amenities' => 'locations#find_amenities'
  get 'report_amenities' => 'locations#report_amenities'  
end
