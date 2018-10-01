class AddPreference < ActiveRecord::Migration[5.2]
  def change
    create_join_table :subtopics, :users, table_name: :preference
  end
end
