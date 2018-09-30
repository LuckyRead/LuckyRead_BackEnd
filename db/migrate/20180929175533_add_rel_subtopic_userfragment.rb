class AddRelSubtopicUserfragment < ActiveRecord::Migration[5.2]
  def change
    create_join_table :subtopics, :userfragments, table_name: :rel_subtopic_userfragment
  end
end
