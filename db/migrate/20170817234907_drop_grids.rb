class DropGrids < ActiveRecord::Migration[5.1]
  def change
    drop_table :grids
  end
end
