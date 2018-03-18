Rails.application.routes.draw do
<<<<<<< HEAD
=======
  resources :checkouts
  devise_for :users
  devise_for :admins
>>>>>>> 8f4d606e62014f59f45d72dd225342c6a6f4875e

  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

  root 'products#new'

  resources :reviews
  resources :products

  get '/products', to: 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
