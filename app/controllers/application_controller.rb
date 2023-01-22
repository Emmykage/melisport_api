class ApplicationController < ActionController::API
  before_action :initialize_cart
  # include ::ActionController::Cookies


  def current_user
    User.find_by(id: 2)
  end

  def initialize_cart
    @shopping_cart ||= ShoppingCart.find_by(user_id: current_user.id)
    return unless @shopping_cart.nil?

    @shopping_cart = current_user.shopping_carts.create
    # session[:shopping_cart_id] = @shopping_cart.id
  end
end
