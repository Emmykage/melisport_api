class AddOrderDetailRefToPaymentDetails < ActiveRecord::Migration[7.0]
  def change
    add_reference :payment_details, :order_detail, null: false, foreign_key: true, type: :uuid
  end
end
