Rails.application.routes.draw do
  root 'home#index'
  resources :home, only: :index

  resources :sessions, only: [:create, :destroy]
  get :logout, to: 'sessions#destroy', as: :logout
  post :login, to: 'sessions#create', as: :login

  resources :users, only: :create
  resources :posts, only: :create
end
