Rails.application.routes.draw do
  root to: 'gossips#index'
  resources :gossips
end
