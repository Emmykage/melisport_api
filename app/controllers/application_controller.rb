class ApplicationController < ActionController::API
    
    include ::ActionController::Cookies
    before_action :initialize_cart
    
    def current_user

      User.first
    end
  def initialize_cart
    # @shopping_cart ||= ShoppingCart.find_by(id: session[:shopping_cart_id])
    shopping_cart ||= current_user.shopping_carts

    if shopping_cart.nil?
      @shopping_cart = current_user.shopping_carts.create
      # session[:shopping_cart_id] = @shopping_cart.id
    end
  end

    # def current_cart
    #     if !session[:shopping_cart_id].nil?
    #         ShoppingCart.find(session[:shopping_cart_id])
    #     else
    #         ShoppingCart.new
    #     end
    # end
end
