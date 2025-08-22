class CreateAgents < ActiveRecord::Migration[7.0]
  def change
    create_table :agents, id: :uuid do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.decimal :discout
      t.string :referral_code
      t.decimal :commission
      t.string :role
      t.boolean :active, defauflt: true

      t.timestamps
    end
  end
end
