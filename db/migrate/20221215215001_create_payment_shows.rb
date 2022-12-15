class CreatePaymentShows < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_shows do |t|
      t.integer :amount
      t.string :provider
      t.boolean :status

      t.timestamps
    end
  end
end
