class rooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.string   "name"
      t.integer  "user_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["user_id"], name: "index_rooms_on_user_id"
    end
  end
end
