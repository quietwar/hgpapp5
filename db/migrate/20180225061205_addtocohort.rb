class Addtocohort < ActiveRecord::Migration[5.1]
  def change
    add_column  :cohorts,  :name, :string
    add_column  :cohorts,  :section, :string
    add_column  :cohorts,  :description, :text
    add_column  :cohorts,  :start_date, :date
    add_column  :cohorts,  :end_date, :date 
  end
end
