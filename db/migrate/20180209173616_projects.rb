class Projects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :utf8, :integer
  end
end
