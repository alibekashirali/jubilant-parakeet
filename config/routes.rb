Rails.application.routes.draw do
  resources :ratings
  devise_for :users
  
  # get 'user', to: 'users#show'
  # resources :users, only: [:show, :destroy]
  get '/users/:id', to: 'users#show', as: 'user'
  
  resources :transports
  resources :specializations, only: [:create, :destroy]
  
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
  get 'add_order', to: 'pages#add_order'
  
end
