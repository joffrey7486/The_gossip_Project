Rails.application.routes.draw do
  get 'accueil/', to: 'static#home'
  get 'team', to: 'static#team'
  get 'contact', to: 'static#contact'
  get 'accueil/:client', to: 'static#client_show'
  get 'gossips/:id', to: "static#gossip_show"
  get 'users/:id', to: 'static#user_show'
end
