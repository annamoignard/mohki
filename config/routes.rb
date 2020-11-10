Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :brands
  get '/brands/:id/listings', to: 'brands#brand_listings', as: 'brand_listings'
  resources :listings 
  root to: "welcome#home"
end
