class ChangeColumnsInAdminUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :admin_users, :provider, :string
    add_column :admin_users, :uid,      :string

    add_index :admin_users, [:provider, :uid], unique: true

    # In order to abolish password authentication, delete the following (leave it if coexisting)
    remove_column :admin_users, :reset_password_token,   :string
    remove_column :admin_users, :reset_password_sent_at, :datetime
  end
end
