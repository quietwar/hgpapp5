class ChangeCohortUserTable < ActiveRecord::Migration[5.1]
  def self.up
    add_column :users, :cohort, :integer
  end
 
  def self.down
    drop_column :users, :cohort_id, :integer
  end
end
