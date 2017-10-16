class AddbenchmarshToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :benchmarks, :string
    add_column :users, :stipend, :integer
  end
end
