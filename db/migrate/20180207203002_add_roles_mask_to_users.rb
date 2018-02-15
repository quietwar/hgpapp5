class AddRolesMaskToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :roles_mask, :integer
    add_column :admin_users, :roles_mask, :integer
  end
end
