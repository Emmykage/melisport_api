class RemoveUserFromOrderItems < ActiveRecord::Migration[7.0]
  def change
    remove_reference :order_items, :user, foreign_key: true
  end
end
