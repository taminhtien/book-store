Rails.application.routes.draw do
  devise_for :users
  resources :books do
  	resources :reviews, except: [:show, :index]
  end
  root "books#index"
end
