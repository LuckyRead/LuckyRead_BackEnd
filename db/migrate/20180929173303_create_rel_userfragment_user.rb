class CreateRelUserfragmentUser < ActiveRecord::Migration[5.2]
  def change
    create_join_table :user, :userfragment, table_name: :rel_userfragment_user
  end
end
