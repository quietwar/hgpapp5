class Addtotables < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :authenticity_token, :string
    add_column :projects, :commit, :string
    add_column :projects, :locale, :string
  end
end
