class ApplicationController < ActionController::API
  # before_action :initialize_cart
  # include ::ActionController::Cookies
  def encode_token(payload)
    JWT.encode(payload, 'secret')
  end
  def decode_token
    # Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiMTIzIn0.AOXUao_6a_LbIcwkaZU574fPqvW6mPvHhwKC7Fatuws

    auth_header = request.headers['Authorization']
    if auth_header
      token = auth_header.split(" ")[1]
      begin
        JWT.decode(token, 'secret', true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end 

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
