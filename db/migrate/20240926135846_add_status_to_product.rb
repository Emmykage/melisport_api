class AddStatusToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :status, :integer, default: 0
    add_column :products, :player_type, :string
    add_column :products, :head_shape, :string
    add_column :products, :recommended_grip, :string
  end
end
