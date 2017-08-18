class DropChatrooms < ActiveRecord::Migration[5.1]
  def change
    drop_table :chatrooms
  end
end
