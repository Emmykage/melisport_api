class AddUpdatedAtProductInventory < ActiveRecord::Migration[7.0]
  def change
    add_column :product_inventories, :updated_at, :datetime
  end
end
