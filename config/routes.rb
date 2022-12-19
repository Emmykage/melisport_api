Rails.application.routes.draw do
  resources :probucts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
 
  namespace :api do
    namespace :v1 do
      resources :users
      resources :products
      resources :probucts

      resources :addresses
      resources :cart_items 
      resources :product_categories 
      resources :user_payments
      

      end
    end


  # Defines the root path route ("/")
  # root "articles#index"
end
