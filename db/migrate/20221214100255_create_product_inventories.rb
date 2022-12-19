class CreateProductInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :product_inventories do |t|
      t.integer :quantity
      t.string :sku
      t.decimal :price
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
