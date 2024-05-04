class AddColoursToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :colours, :string, array: true, default: []
    #Ex:- :default =>''
  end
end
