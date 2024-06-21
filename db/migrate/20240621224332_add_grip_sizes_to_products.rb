class AddGripSizesToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :grip_sizes, :string, array: true, default: []

  end
end
