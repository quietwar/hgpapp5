class AddToTable < ActiveRecord::Migration[5.1]
  def up
    add_column :users, :city, :string
    add_column :users, :cohort, :integer
    add_column :users, :email2, :string
    add_column :users, :projects, :string
    add_column :users, :cell, :integer
    # add_column :users, :unconfirmed_email, :string # Only if using reconfirmable
    # All existing user accounts should be able to log in after this.
  end

  def down
    remove_columns :users, :title, :string
    remove_columns :users, :admin, :boolean
    # remove_columns :users, :unconfirmed_email # Only if using reconfirmable
  end
end
