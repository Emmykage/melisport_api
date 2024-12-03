class AddDeliveryFeeToOrderDetail < ActiveRecord::Migration[7.0]
  def change
    add_column :order_details, :delivery_fee, :decimal
  end
end
