class AddToTableCohort < ActiveRecord::Migration[5.1]
  def change
    
    add_column :cohorts, :cell, :integer

  end
end
