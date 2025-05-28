class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles, id: :uuid do |t|
      t.string :state
      t.string :address

      t.timestamps
    end
  end
end
