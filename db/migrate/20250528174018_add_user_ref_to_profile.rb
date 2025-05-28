class AddUserRefToProfile < ActiveRecord::Migration[7.0]
  def change
    add_reference :profiles, :user, null: false, foreign_key: true, type: :uuid
  end
end