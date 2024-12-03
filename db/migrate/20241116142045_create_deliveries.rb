class CreateDeliveries < ActiveRecord::Migration[7.0]
  def change
    create_table :deliveries, id: :uuid do |t|
      t.string :state
      t.string :city
      t.decimal :delivery_fee

      t.timestamps
    end
  end
end
