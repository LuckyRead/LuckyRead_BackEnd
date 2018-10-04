class AddFkToFriend < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :friends, :users, column: :follower
    add_foreign_key :friends, :users, column: :followed
  end
end
