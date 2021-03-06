Rails.application.routes.draw do
  resources :orders
  resources :line_items
  resources :carts, except: [:index, :edit]
  devise_for :users
  resources :books do
    collection do
      get 'search'
    end
  	resources :reviews, except: [:show, :index]
  end
  root "books#index"
end
