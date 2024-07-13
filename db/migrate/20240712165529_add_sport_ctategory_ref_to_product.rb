class AddSportCtategoryRefToProduct < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :sport_category, null: true, foreign_key: true, type: :uuid
  end
end
