class AddReactionColumnToReacionUserFragment < ActiveRecord::Migration[5.2]
  def change
    add_column :reaction_user_fragment, :reaction, :string, :null => false
    #Ex:- :null => false
  end
end
