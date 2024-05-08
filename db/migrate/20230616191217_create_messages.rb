class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages, id: :uuid do |t|
      t.string :subject
      t.text :content

      t.timestamps
    end
  end
end
