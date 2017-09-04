class RenameCohortToCohortId < ActiveRecord::Migration[5.1]
  def change
     rename_column :users, :cohort, :cohort_id
     rename_column :cohorts, :cohort, :cohort_id
  end
end
