class AddRelSubtopicUserfragment < ActiveRecord::Migration[5.2]
  def change
    create_join_table :sub_topics, :userfragments, table_name: :rel_subtopic_userfragment
  end
end
