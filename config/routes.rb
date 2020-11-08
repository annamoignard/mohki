Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :brands
  resources :listings 
  root to: "welcome#home"
end
