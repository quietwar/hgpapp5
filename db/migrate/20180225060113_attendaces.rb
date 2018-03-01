class Attendaces < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances  do |t|
      t.integer  :user_id,    null: false
      t.integer  :classroom_id,  null: false
      t.string   :status,     null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
  end

  add_index "attendances", ["classroom_id"], name: "index_attendances_on_classroom_id", using: :btree
  add_index "attendances", ["user_id"], name: "index_attendances_on_user_id", using: :btree
end
end
