class Createprojects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.integer :duration_in_min
      t.text :workout
      t.date :workout_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
