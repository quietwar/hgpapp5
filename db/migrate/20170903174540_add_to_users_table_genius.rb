class AddToUsersTableGenius < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :genius, :string
  end

  def change
     add_column :cohorts, :first_name, :string
     add_column :cohorts, :last_name, :string
  end
end
