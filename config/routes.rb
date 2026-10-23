Rails.application.routes.draw do
  root 'top#main'
  
  get 'top/main'
  post 'top/login'
  get 'top/logout'

  resources :users
  resources :tweets
  resources :likes, only: [:create, :destroy]
  resources :profiles
end