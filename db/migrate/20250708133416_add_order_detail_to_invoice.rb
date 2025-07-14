class AddOrderDetailToInvoice < ActiveRecord::Migration[7.0]
  def change
    add_reference :invoices, :order_detail, null: false, foreign_key: true, type: :uuid
    remove_reference :invoices, :order_details
  end
end
