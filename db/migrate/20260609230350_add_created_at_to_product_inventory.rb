class AddCreatedAtToProductInventory < ActiveRecord::Migration[7.0]
  def change
    add_column :product_inventories, :created_at, :datetime
  end
end
