class Api::V1::PaymentIntentsController < ApplicationController
    # before_action :StripeService.new
    def create
        # Set your secret key. Remember to switch to your live secret key in production.
# See your keys here: https://dashboard.stripe.com/apikeys
Stripe.api_key = 'sk_test_51NA8CuHxI0r7Hp29GJQ297xqajlQKbSvjlEvvPrgYM872PVxHWmy6StYmpphzayVBBVFe3J9AhZginP1PbJvzjKP00n9tvt5SO'

 intent = Stripe::PaymentIntent.create({
  amount:  params[:amount],
  currency: 'usd',
  payment_method_types: ['card'],
})

# puts params[:amount]
# {client_secret: intent.client_secret}.to_json
render json: {client_secret: intent.client_secret}
# client_secret: intent.client_secret
    end

   
    
end
