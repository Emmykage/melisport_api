class AddUserToOrderItems < ActiveRecord::Migration[7.0]
  def change
    add_reference :order_items, :user, null: false, foreign_key: true, type: :uuid
    # remove_column :order_details, :user
  end
end
