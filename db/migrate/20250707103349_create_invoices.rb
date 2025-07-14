class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices, id: :uuid do |t|
      t.string :invoice_number
      t.references :order_details, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
        add_index :invoices, :invoice_number, unique: true
  end
end