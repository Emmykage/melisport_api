class AddStateToBillingAddresses < ActiveRecord::Migration[7.0]
  def change
    add_column :billing_addresses, :state, :string
    change_column :order_details, :user_id, :uuid, null: true, foreign_key: true

  end
end