class CreateCourts < ActiveRecord::Migration[7.0]
  def change
    create_table :courts, id: :uuid do |t|
      t.string :address
      t.string :state
      t.string :city

      t.timestamps
    end
  end
end
