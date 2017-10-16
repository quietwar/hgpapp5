class DropColumnCohortUsers < ActiveRecord::Migration[5.1]
  def change
    remove_columns :users, :cohort
  end
end
