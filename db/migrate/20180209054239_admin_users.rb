class AdminUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :admin_users, :username, :string
    add_column :admin_users, :superadmin, :boolean
  end
end
