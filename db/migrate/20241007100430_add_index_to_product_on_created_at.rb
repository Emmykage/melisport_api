class AddIndexToProductOnCreatedAt < ActiveRecord::Migration[7.0]
  def change
    add_index :products, :created_at
  end
end
