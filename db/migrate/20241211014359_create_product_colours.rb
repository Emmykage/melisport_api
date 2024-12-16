class CreateProductColours < ActiveRecord::Migration[7.0]
  def change
    create_table :product_colours, id: false do |t|
      t.string :colour
      t.integer :quantity, default: 0
      t.references :product, foreign_key: true, type: :uuid

    end
  end
end
