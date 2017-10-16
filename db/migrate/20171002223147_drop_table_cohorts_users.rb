class DropTableCohortsUsers < ActiveRecord::Migration[5.1]
  def down
    remove_columns :users, :cohorts, :string
    remove_columns :users, :cohort_id, :integer
  end
end
