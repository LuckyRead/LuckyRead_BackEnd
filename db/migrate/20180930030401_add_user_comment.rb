class AddUserComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :user_iduser, :string, :null => false
  end
end
