class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :grip_size
      t.integer :head_size
      # t.integer :size
      t.decimal :rating
      t.string :length
      t.string :weight
      t.string :swing_weight
      t.string :stiffness
      t.string :tension
      t.string :composition
      t.text :description
      t.decimal :price
      t.string :sku
      t.string :image
      # t.string :strung
      # t.string :colour



      t.references :product_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
