class ChangeIntegerUsersTable < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :cell, :integer, limit: 8
  end
end
