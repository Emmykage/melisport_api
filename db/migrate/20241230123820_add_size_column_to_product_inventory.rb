class AddSizeColumnToProductInventory < ActiveRecord::Migration[7.0]
  def change
    add_column :product_inventories, :size, :string
    add_column :product_inventories, :location, :string
    add_column :product_inventories, :colour, :string

    remove_column :product_inventories, :created_at, :datetime
    remove_column :product_inventories, :updated_at, :datetime
  end
end
