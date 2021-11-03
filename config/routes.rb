Rails.application.routes.draw do
  root to: 'gossips#index'
  resources :users, only: [:show]
  resources :cities, only: [:show]
  resources :gossips do
    resources :comments, except: [:index, :show]
  end  
end
