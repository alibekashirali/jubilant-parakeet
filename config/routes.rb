Rails.application.routes.draw do
  devise_for :users
  
  # get 'user', to: 'users#show'
  # resources :users, only: [:show, :destroy]
  get '/users/:id', to: 'users#show', as: 'user'
  
  resources :transports
  
  resources :orders do
    resources :bids, shallow: true
    resources :comments, shallow: true
  end
  
  resources :categories do
    resources :orders, shallow: true
  end
  
  root 'pages#home'

  get 'home', to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'help', to: 'pages#help'
  
end
