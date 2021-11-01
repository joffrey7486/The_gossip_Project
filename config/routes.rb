Rails.application.routes.draw do
  get 'acceuil', to: 'static#home'
  get 'team', to: 'static#team'
  get 'contact', to: 'static#contact'
end
