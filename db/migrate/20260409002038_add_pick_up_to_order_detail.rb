class AddPickUpToOrderDetail < ActiveRecord::Migration[7.0]
  def change
    add_column :order_details, :pick_up, :boolean, defailt: false
  end
end
