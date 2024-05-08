class CreateProductImages < ActiveRecord::Migration[7.0]
  def change
    create_table :product_images, id: :uuid do |t|
      t.string :images
      t.references :product, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
