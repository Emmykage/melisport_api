class AddMsCodeToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :ms_code, :string
  end
end
