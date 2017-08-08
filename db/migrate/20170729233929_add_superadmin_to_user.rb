class AddSuperadminToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :superadmin, :boolean, :null => false, :default => false
  end
end