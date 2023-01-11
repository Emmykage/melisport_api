class CreateProductCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :product_categories do |t|
      t.string :name
      t.string :gender
      t.text :description
      # t.references :product_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
