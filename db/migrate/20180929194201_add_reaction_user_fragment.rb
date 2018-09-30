class AddReactionUserFragment < ActiveRecord::Migration[5.2]
  def change
    create_join_table :user, :fragments, table_name: :reaction_user_fragment
  end
end
