class AddColumnsToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :strung, :string
    add_column :products, :colour, :string
    add_column :products, :size, :string
    # add_column :products, :tension, :string
  end
end
