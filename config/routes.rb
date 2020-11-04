Rails.application.routes.draw do
  root 'explore#index'
  resources :home, only: :index

  resources :sessions, only: [:create, :destroy]
  get :logout, to: 'sessions#destroy', as: :logout
  post :login, to: 'sessions#create', as: :login

  resources :users, only: [:create, :update]
  resources :posts, only: [:create, :edit, :update, :destroy]
  resources :notifications, only: :index
  resources :explore, only: :index do
    get :search, on: :collection
  end


  get '/p/:user_url', to: 'profiles#index', as: :profile_index
  get '/followers/handle', to: 'followers#handle', as: :handle
  post '/notifications/mark_as_read', to: 'notifications#mark_as_read', as: :mark_as_read
  get '/notifications/get_new_count', to: 'notifications#get_new_count', as: :get_new_count

end
