class AddToAdminTableEmail2String < ActiveRecord::Migration[5.1]
  def change
    add_column :admin_users, :email2, :string
  end
end
