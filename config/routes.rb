Rails.application.routes.draw do
  root "api/v1/products#index"

  get 'passwords/reset_password'
  resources :messages
  get 'levels/index'
  get 'genders/index'
  get 'genderd/index'
  resources :images
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :users do
        collection do
          post :password_reset
        end
      end
      resources :products do
        collection do
          get :new_arrivals
        end

      end
      resources :addresses
      resources :cart_items
      resources :shopping_carts
      resources :product_categories
      resources :sport_categories
      resources :levels
      resources :genders
      resources :user_payments
      resources :order_details
      resources :order_items
      # resources :payments
      resources :payment_intents
      resources :messages

      post "/login", to: "users#login"

      get 'shopping_cart', to: 'shopping_cart#show'
      post 'shopping_cart/add', to: 'shopping_cart#add'
      post 'shopping_cart/remove'
      delete 'clear_cart', to: 'cart_items#delete_all'
      post 'search', to: 'products#search'
      # patch 'cart_item/:id/:data' to: 'shopping_cart#creat'


      # post "add_cart", to: "cart_items#create"


      end
    end

    get 'confirm_email', to: "registrations#confirm_email"
    get 'reset_password', to: "password#reset_password"

  # Defines the root path route ("/")
  # root "articles#index"
end
