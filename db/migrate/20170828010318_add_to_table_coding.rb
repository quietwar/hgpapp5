class AddToTableCoding < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :app_name, :string
    add_column :users, :coding, :string
    add_column :users, :project_details, :text
    add_column :users, :start_date, :date
    add_column :users, :user_id, :integer
    
  end
end
