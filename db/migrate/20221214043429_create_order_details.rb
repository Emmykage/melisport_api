class CreateOrderDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :order_details do |t|
      t.decimal :total
      t.references :user, null: false, foreign_key: true
      t.references :payment_detail, null: false, foreign_key: true

      t.timestamps
    end
  end
end
