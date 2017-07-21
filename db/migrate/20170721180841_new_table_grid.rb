class NewTableGrid < ActiveRecord::Migration[5.0]
  def change
    create_table :grids do |t|
      t.string   "genius"
      t.integer   "cohorts"
      t.string   "email"
      t.integer   "cell"
      t.integer   "stipend"
      t.boolean   "completed"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
