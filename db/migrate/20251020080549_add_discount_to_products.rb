class AddDiscountToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :discount, :integer, :default => 0
    #Ex:- :default =>'', : =>  value
    #Ex:- :default =>''
    add_column :products, :discount_amount, :decimal
  end
end
