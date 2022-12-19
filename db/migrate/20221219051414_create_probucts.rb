class CreateProbucts < ActiveRecord::Migration[7.0]
  def change
    create_table :probucts do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.references :product_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
