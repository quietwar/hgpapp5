class AdminUserTableCell < ActiveRecord::Migration[5.1]
  def change
    add_column :admin_users, :cell, :integer
  end
end
