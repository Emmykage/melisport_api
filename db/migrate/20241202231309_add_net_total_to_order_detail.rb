class AddNetTotalToOrderDetail < ActiveRecord::Migration[7.0]
  def change
    add_column :order_details, :net_total, :decimal
  end
end
