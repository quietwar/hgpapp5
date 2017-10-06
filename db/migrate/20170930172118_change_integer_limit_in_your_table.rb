class ChangeIntegerLimitInYourTable < ActiveRecord::Migration[5.1]
  def change
    change_column :cohorts, :cohort, :integer, limit: 8
    change_column :cohorts, :cell, :integer, limit: 8
   end
end
