class SetUpFriendTable < ActiveRecord::Migration[5.2]
  def change
    add_column :friend, :followed, :string, :null => false
    add_column :friend, :follower, :string, :null => false
    #Ex:- :null => false
    remove_column :friend, :user_id
  end
end
