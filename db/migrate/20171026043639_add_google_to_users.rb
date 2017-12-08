class AddGoogleToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :google_oauth2, :string
  end
end
