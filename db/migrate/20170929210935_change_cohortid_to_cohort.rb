class ChangeCohortidToCohort < ActiveRecord::Migration[5.1]

  def self.up
    add_column :cohorts, :cohort, :integer
  end
 
  def self.down
    change_column :cohorts, :cohort_id, :integer
  end
end
