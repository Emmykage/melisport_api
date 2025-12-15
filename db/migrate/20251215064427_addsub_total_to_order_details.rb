class AddsubTotalToOrderDetails < ActiveRecord::Migration[7.0]
  def change
    add_column :order_details, :sub_total, :decimal
    add_column :order_details, :vat, :decimal
    add_column :order_details, :bonus, :decimal
    add_reference :order_details, :agent, null: true, foreign_key: true, type: :uuid
  end
end