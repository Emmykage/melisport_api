class CreateCartItems < ActiveRecord::Migration[7.0]
  def change
    create_table :cart_items, id: :uuid do |t|
      t.integer :quantity
      t.references :shopping_cart, null: false, foreign_key: true, type: :uuid
      t.references :product, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
