class AddFriend < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :users, table_name: :friend
  end
end
