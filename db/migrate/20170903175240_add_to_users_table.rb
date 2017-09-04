class AddToUsersTable < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :genius, :string
  end
end
