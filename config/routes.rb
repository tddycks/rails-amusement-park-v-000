Rails.application.routes.draw do

  root to: 'static#index'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :users
  resources :attractions
  resources :rides




end