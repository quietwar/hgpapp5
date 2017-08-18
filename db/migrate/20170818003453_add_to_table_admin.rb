class AddToTableAdmin < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :title, :string
  end
end
