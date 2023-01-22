Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
 
  namespace :api do
    namespace :v1 do
      resources :users
      resources :products
      resources :addresses
      resources :cart_items
      resources :shopping_carts
      resources :product_categories
      resources :user_payments

      get 'shopping_cart', to: 'shopping_cart#show'
      post 'shopping_cart/add', to: 'shopping_cart#add'
      post 'shopping_cart/remove'
      patch 'cart_item/:id/:data' to: ''
      

      # post "add_cart", to: "cart_items#create"
      

      end
    end


  # Defines the root path route ("/")
  # root "articles#index"
end
