Rails.application.routes.draw do

  root 'home#index'

  post 'verify-login', to: 'sessions#verify_login'

  resources :sessions, only: [:create]

  resources :patients, only: [:create, :index]
  resources :doctors, only: [:create, :index]
  resources :appointments, only: [:create, :index]
  resources :users, only: [:show]

end