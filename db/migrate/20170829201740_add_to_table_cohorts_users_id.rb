class AddToTableCohortsUsersId < ActiveRecord::Migration[5.1]
  def change
    add_column :cohorts, :user_id, :integer
  end
end
