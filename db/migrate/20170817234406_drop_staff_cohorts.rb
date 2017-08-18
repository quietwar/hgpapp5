class DropStaffCohorts < ActiveRecord::Migration[5.1]
  def change
    drop_table :staff_cohort
  end
end
