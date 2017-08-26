class AddToTableCohortsAdminIdBoolean < ActiveRecord::Migration[5.1]
  def change
    add_column :cohorts, :admin_id, :integer

  end
end
