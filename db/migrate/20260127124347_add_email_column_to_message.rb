class AddEmailColumnToMessage < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :email, :string
    add_column :messages, :name, :string
    add_column :messages, :phone, :string
    add_column :messages, :read, :boolean, default: false
  end
end
