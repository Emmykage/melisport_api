Rails.application.routes.draw do
  resources :payment_shows
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
 
  namespace :api do
    namespace :v1 do
      resources :users
      resources :products
      resources :addresses
      resources :cart_items 
      resources :product_categories 

      end
    end


  # Defines the root path route ("/")
  # root "articles#index"
end
