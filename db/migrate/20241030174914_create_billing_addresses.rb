class CreateBillingAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :billing_addresses, id: :uuid do |t|
      t.string :name
      t.string :email
      t.string :phone_no
      t.string :street
      t.string :city
      t.string :postal_code
      t.references :order_detail, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
