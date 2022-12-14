class CreateUserPayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_types do |t|
      t.string :payment_type
      t.string :provider
      t.integer :account_no
      t.date :expiry

      t.timestamps
    end
  end
end
