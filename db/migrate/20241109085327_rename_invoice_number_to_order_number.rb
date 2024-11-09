class RenameInvoiceNumberToOrderNumber < ActiveRecord::Migration[7.0]
  def change
    rename_column :order_details, :invoice_number, :order_number
  end
end
