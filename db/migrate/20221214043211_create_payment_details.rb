class CreatePaymentDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_details do |t|
      t.references :order_detail, null: false, foreign_key: true
      t.decimal :amount
      t.string :provider
      t.boolean :status

      t.timestamps
    end
  end
end
