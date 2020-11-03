Rails.application.routes.draw do
  root 'home#index'
  resources :home, only: :index

  resources :sessions, only: [:create, :destroy]
  get :logout, to: 'sessions#destroy', as: :logout
  post :login, to: 'sessions#create', as: :login

  resources :users, only: [:create, :update]
  resources :posts, only: :create
  get '/p/:user_url', to: 'profiles#profile', as: :profile
  get '/followers/handle', to: 'followers#handle', as: :handle

end
