class AddIndexToUsersTable < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :project_id, :integer
    add_column :users, :project, :string
    
    add_index :users, :project, unique: true
    add_index :users, :genius, unique: true
  end
end
