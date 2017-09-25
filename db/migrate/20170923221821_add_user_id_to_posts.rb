class AddUserIdToPosts < ActiveRecord::Migration[5.1]
  
  	def self.up
    change_column :cohorts, :genius, :string
  end
 
  def self.down
    change_column :cohorts, :genius, :text
  end
end
