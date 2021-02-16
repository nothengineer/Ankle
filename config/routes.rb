Rails.application.routes.draw do
  get 'cards/new'
  resources :posts
  devise_for :users
  resources :users
  root 'movies#index'
  resources :movies do
    resources :comments
    resources :orders
  end
  resources :cards
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end