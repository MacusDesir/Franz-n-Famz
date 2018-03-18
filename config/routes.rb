Rails.application.routes.draw do
  # devise_for :users
  # devise_for :admins
  root 'login#index'
  get 'login/index'

  resources :reviews
  resources :products

  get '/products', to: 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
