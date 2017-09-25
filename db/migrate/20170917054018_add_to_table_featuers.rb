class AddToTableFeatuers < ActiveRecord::Migration[5.1]
  def change
    add_column :features, :user_id, :integer

    add_index :features, :user_id, unique: true
  end
end
