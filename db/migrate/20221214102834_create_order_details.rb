class CreateOrderDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :order_details, id: :uuid do |t|
      t.decimal :total
      t.references :user, null: false, foreign_key: true, type: :uuid
      # t.references :payment_detail, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
