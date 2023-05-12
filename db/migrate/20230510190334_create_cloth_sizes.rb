class CreateClothSizes < ActiveRecord::Migration[7.0]
  def change
    create_table :cloth_sizes do |t|
      t.string :abbrv
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
