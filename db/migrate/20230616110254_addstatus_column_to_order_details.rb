class AddstatusColumnToOrderDetails < ActiveRecord::Migration[7.0]
  def change
    add_column :order_details, :status, :string
  end
end
