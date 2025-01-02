class RenameQuantityColumnToProductQuantity < ActiveRecord::Migration[7.0]
  def change
    rename_column :products, :quantity, :product_quantity
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
