class AddtoTable < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string  :app_name
      t.string  :coding
      t.text    :project_details
      t.date    :start_date
      t.integer  :user_id
      t.datetime :created_at,      null: false
      t.datetime  :updated_at,      null: false
      t.index ["user_id"], name: "index_projects_on_user_id"
  end
  end
end
