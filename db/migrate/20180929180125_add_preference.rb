class AddPreference < ActiveRecord::Migration[5.2]
  def change
    create_join_table :sub_topics, :users, table_name: :preference
  end
end
