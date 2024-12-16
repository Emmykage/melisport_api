class RemoveShoeSizeFromProducts < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :shoe_sizes, :string, array: true

  end
end
