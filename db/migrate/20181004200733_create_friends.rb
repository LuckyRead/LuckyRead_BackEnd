class CreateFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do |t|
      t.bigint :follower, :null => false
      t.bigint :followed, :null => false
      
      t.timestamps
    end
  end
end
