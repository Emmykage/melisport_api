class AddLocationsToProductInventory < ActiveRecord::Migration[7.0]
  def change
    add_column :product_inventories, :locations, :string, array: true, default: []
  end
end
