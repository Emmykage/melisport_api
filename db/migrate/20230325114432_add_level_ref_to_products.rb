class AddLevelRefToProducts < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :level, null: true, foreign_key: true
  end
end
