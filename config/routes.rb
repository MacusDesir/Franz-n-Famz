Rails.application.routes.draw do
  devise_for :users
  devise_for :admins

  authenticated :user do
    root to: "products#index"
  end

  unauthenticated :user do
    root to: "devise/sessions#new"
  end
  # root 'devise/sessions#new'

  resources :reviews
  resources :products

  get '/products', to: 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
