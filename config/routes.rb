Rails.application.routes.draw do
  resources :users
  get '/auth/facebook/callback' => 'sessions#create'
  end
