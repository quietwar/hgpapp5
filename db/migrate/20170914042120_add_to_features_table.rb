class AddToFeaturesTable < ActiveRecord::Migration[5.1]
  def change
    add_column :features, :genius, :string
  end
end
