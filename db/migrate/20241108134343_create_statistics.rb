class CreateStatistics < ActiveRecord::Migration[7.0]
  def change
    create_table :statistics, id: :uuid do |t|

      t.timestamps
    end
  end
end
