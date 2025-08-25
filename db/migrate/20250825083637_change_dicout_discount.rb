class ChangeDicoutDiscount < ActiveRecord::Migration[7.0]
  def change
      rename_column :agents, :discout, :discount
      # change_column :agents, :discount, :decimal, precision: 5, scale: 2, default: 0.0
  end
end
