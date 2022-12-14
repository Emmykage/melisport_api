class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :region
      t.integer :postal_code
      t.integer :mobile

      t.timestamps
    end
  end
end
