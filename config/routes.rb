Rails.application.routes.draw do

  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

  root 'products#new'
  
  get 'carts/show'
  resources :checkouts
  resources :reviews
  resources :products

  resources :cart, only: [:show] do
<<<<<<< HEAD
    put 'add/:product_id', to: 'carts#add', as: :add_to
    put 'remove/:product_id', to: 'carts#remove', as: :remove_from
=======
    put 'add/:product_id', to: 'carts#add', as:
  :add_to
    put 'remove/:product_id' to: 'carts#remove', as:
  :remove_from
>>>>>>> 18bb77200de8b3daa30859c677578c72aa0c9943
  end

  get '/products', to: 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
