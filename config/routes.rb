Rails.application.routes.draw do
  root to: "welcome#home"
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :brands
  get '/brands/:id/listings', to: 'brands#brand_listings', as: 'brand_listings'
  resources :listings do 
    resources :likes, only: [:create] 
  end 
  delete '/listings/:id/likes', to: 'likes#destroy', as: 'unlike'
  resources :likes, only: [:index]
  resources :searches, only: [:index]
  resources :payments, only: [:create]
  get '/payments/success', to: 'payments#success'
  get '/payments/cancel', to: 'payments#cancel'
  post '/payments/webhook', to: 'payments#webhook'
end

