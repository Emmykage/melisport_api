class CreateProductInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :product_inventories, id: :uuid do |t|
      t.integer :quantity
      t.string :sku
      t.decimal :price
      t.references :product, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
