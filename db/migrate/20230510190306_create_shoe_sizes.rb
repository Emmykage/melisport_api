class CreateShoeSizes < ActiveRecord::Migration[7.0]
  def change
    create_table :shoe_sizes do |t|
      t.string :abbrv
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
