class CreateLevels < ActiveRecord::Migration[7.0]
  def change
    create_table :levels, id: :uuid do |t|
      t.string :stage

      t.timestamps
    end
  end
end
