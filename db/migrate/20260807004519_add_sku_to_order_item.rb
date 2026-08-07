class AddSkuToOrderItem < ActiveRecord::Migration[7.0]
  def change
    add_column :order_items, :sku, :string
    add_column :order_items, :bonus, :decimal, precision: 10, scale: 2, default: 0.0
  end
end
