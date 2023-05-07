class AddTensionColumnToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :tension, :string
  end
end
