class CreateShoeSizes < ActiveRecord::Migration[7.0]
  def change
    create_table :shoe_sizes, id: false uid do |t|
      t.string :size
      t.integer :quantity, default: 0
      t.references :product, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
