class AddToTableUsersCohorts < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :cohorts, :string
  end
end
