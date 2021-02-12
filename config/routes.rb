Rails.application.routes.draw do
  

  root 'events#index'

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :events
  resources :enrollments, only: [:create, :destroy]
end
