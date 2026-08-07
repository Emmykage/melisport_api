class AddSizeToOrderItem < ActiveRecord::Migration[7.0]
  def change
    add_column :order_items, :size, :string
  end
end
