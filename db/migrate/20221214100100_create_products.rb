class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products, id: :uuid do |t|
      t.string :name
      t.string :grip_size
      t.string :head_size
      t.decimal :rating
      t.string :length
      t.string :weight
      t.string :swing_weight
      t.string :stiffness
      t.string :composition
      t.text :description
      t.decimal :price
      t.string :sku
      t.string :image
      t.string :shoe_sizes, array: true, default: [] # Add shoe_sizes column as an array
      t.string :cloth_sizes, array: true, default: [] # Add shoe_sizes column as an array





      t.references :product_category, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
