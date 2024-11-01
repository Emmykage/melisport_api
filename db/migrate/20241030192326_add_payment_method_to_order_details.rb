class AddPaymentMethodToOrderDetails < ActiveRecord::Migration[7.0]
  def change
    add_column :order_details, :payment_method, :integer, :default => 0
  end
end
