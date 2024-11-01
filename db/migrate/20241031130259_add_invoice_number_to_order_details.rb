class AddInvoiceNumberToOrderDetails < ActiveRecord::Migration[7.0]
  def change
    add_column :order_details, :invoice_number, :string
  end
end
