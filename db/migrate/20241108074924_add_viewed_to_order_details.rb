class AddViewedToOrderDetails < ActiveRecord::Migration[7.0]
  def change
    add_column :order_details, :viewed, :boolean, default: false
    add_column :order_details, :paid_at, :datetime  end
end
