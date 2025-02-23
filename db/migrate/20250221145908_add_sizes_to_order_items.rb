class AddSizesToOrderItems < ActiveRecord::Migration[7.0]
  def change
    add_column :order_items, :sizes, :string, array: true, :default => []
    #Ex:- :default =>''
  end
end
