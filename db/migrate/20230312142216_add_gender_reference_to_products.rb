class AddGenderReferenceToProducts < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :gender, null: false, foreign_key: true
  end
end
