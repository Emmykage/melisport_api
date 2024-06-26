class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses, id: :uuid do |t|
      t.string :city
      t.string :region
      t.integer :postal_code
      t.integer :mobile
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
