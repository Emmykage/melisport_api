class Api::V1::PaymentsController < ApplicationController
    # before_action :StripeService.new
    def create
        customer = Stripe::Customer.create({
            :email => Params[:stripeEmail],
            :source => params[:stripeToken]
        })
        charge = Stripe::Charge.create({
            :customer => customer.id,
            :amount => 500,
            :description => 'Description of your product',
            :currency => 'usd'
          })
        
          rescue Stripe::CardError => e
            flash[:error] = e.message
            redirect_to new_payment_path
        
        
    end
    
end
