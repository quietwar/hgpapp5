class RenameTable < ActiveRecord::Migration[5.0]
  def change
    rename_table :admin_cohorts, :staff_cohort
  end
end
