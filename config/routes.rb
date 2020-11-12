Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :brands
  get '/brands/:id/listings', to: 'brands#brand_listings', as: 'brand_listings'
  resources :listings do 
    resources :likes, only: [:create, :destroy]
  end 
  resources :likes, only: [:index]
  resources :searches, only: [:index]
  root to: "welcome#home"
end

