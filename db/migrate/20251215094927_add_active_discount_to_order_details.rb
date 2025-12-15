class AddActiveDiscountToOrderDetails < ActiveRecord::Migration[7.0]
  def change
    add_column :order_details, :discount, :decimal
  end
end
