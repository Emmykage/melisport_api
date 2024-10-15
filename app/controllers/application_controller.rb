class ApplicationController < ActionController::API
  # before_action :initialize_cart
  # include ::ActionController::Cookies
  def encode_token(payload)
    JWT.encode(payload, 'secret')
  end

  def decode_token
    # Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiMTIzIn0.AOXUao_6a_LbIcwkaZU574fPqvW6mPvHhwKC7Fatuws

    auth_header = request.headers['Authorization']
    return unless auth_header

    token = auth_header.split[1]

    begin
      JWT.decode(token, 'secret', true, algorithm: 'HS256')
    rescue JWT::DecodeError
      nil
    end
  end

  def authorized_user
    decode_token = decode_token()
    return unless decode_token

    user_id = decode_token[0]['user_id']
    @current_user = User.find_by(id: user_id)
  end

  def authorize
    render json: { message: 'You have to log in.' }, status: :unauthorized unless
    authorized_user
  end

  def initialize_cart
    @shopping_cart ||= ShoppingCart.find_by(user_id: @current_user.id)
    return unless @shopping_cart.nil?

    @shopping_cart = @current_user.shopping_carts.create
    # session[:shopping_cart_id] = @shopping_cart.id
  end
  def initializeStripe
    StripeService.new

  end

end