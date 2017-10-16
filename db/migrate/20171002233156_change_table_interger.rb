class ChangeTableInterger < ActiveRecord::Migration[5.1]
  def change
    change_column :admin_users, :cell, :integer, limit: 8
   end
end
