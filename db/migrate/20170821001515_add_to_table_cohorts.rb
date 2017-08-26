class AddToTableCohorts < ActiveRecord::Migration[5.1]
  def change
    add_column :cohorts, :city, :string
    add_column :cohorts, :cohort, :integer
    add_column :cohorts, :email, :string
    add_column :cohorts, :email2, :string
    add_column :cohorts, :stipend, :integer
    add_column :cohorts, :benchmark, :string
    add_column :cohorts, :projects, :string
    # add_column :users, :unconfirmed_email, :string # Only if using reconfirmable
    #add_index :cohorts, :confirmation_token, unique: true
    # User.reset_column_information # Need for some types of updates, but not for update_all.
    # To avoid a short time window between running the migration and updating all existing
    # users as confirmed, do the following
    #User.all.update_all confirmed_at: DateTime.now
    # All existing user accounts should be able to log in after this.
  end
end
