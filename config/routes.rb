Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create]do
    member do
      get :followings
      get :followers
      get :clips
    end
  end
  
  resources :microposts, only: [:show, :create, :destroy]do
    member do
      get :clipped_users
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:show, :create, :destroy]

end
