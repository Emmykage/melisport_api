class CreateShoppingCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :shopping_carts, id: :uuid do |t|
      t.integer :total
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
