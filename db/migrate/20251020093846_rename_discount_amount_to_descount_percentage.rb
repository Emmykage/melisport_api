class RenameDiscountAmountToDescountPercentage < ActiveRecord::Migration[7.0]
  def change
    rename_column :products, :discount_amount, :discount_percentage
  end
end