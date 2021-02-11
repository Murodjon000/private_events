Rails.application.routes.draw do
  get 'events/new'
  get 'events/show'
  root 'users#new'

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  # resources :events
end
