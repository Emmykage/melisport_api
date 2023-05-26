require 'stripe'
class StripeService
    def initialize()
        Stripe.api_key = ENV['STRIPE_SECRETE_KEY']
    end

    def find_create_customer(customer)
        if customer.stripe_customer_id.present?
            stripe_customer = Stripe::Customer.retrieve(customer.stripe_customer_id)
        else
         stripe_customer = Stripe::Customer.create({
            name: customer.full_name,
            email: customer.email,
            phone: customer.phone_no
         })
        customer.update(stripe_customer_id: stripe_customer.id)
         end
         stripe_customer
    end
    def create_card_token(params)
        Stripe::Token.create({
            card: {
                number: params[:card_number].to_s,
                exp_month: params[:exp_month],
                exp_year: params[:exp_year],
                cvc: params[:cvv]
            }
        })
    end

    def create_stripe_customer_card(params, stripe_customer)
        token = create_card_token(params)
        Stripe::Customer.create_source(
            stripe_cutomer.id,
            {source: token.id }
        )
        
    end
    
        
end