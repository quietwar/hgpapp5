class DropColumnUsersTable < ActiveRecord::Migration[5.1]
  def change
    remove_columns :users, :cohorts 
  end
end
