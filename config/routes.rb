Rails.application.routes.draw do
  get 'carts/show'

  resources :checkouts
  devise_for :users
  devise_for :admins

  authenticated :user do
    root to: "products#index"
  end

  unauthenticated :user do
    root to: "devise#sessions#new"
  end
  # root 'devise/sessions#new'

  resources :reviews
  resources :products
  # resources :cart, only: [:show] do
  #   put 'add/:product_id', to: 'carts#add', as: :add_to
  #   put 'remove/:product_id' to: 'carts#remove', as: :remove_from
  # end

  get '/products', to: 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
