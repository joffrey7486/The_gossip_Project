Rails.application.routes.draw do
  root to: 'gossips#index'
  resources :users, only: [:show, :new, :create]
  resources :cities, only: [:show]
  resources :gossips do
    resources :comments, except: [:index, :show]
    resources :likes, only: [:create, :destroy]
  end
  resources :sessions, only: [:new, :create, :destroy]


end

