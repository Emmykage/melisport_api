class AddRefCodeToOrderDetail < ActiveRecord::Migration[7.0]
  def change
    add_column :order_details, :ref_code, :string
  end
end
