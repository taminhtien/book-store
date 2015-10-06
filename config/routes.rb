Rails.application.routes.draw do
  resources :line_items
  resources :carts
  devise_for :users
  resources :books do
  	resources :reviews, except: [:show, :index]
  end
  root "books#index"
end
