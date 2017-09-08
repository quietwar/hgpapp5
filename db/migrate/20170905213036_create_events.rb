class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :event
      t.integer :staff_id
      t.string :notes
      t.timestamps
    end
  end
end
