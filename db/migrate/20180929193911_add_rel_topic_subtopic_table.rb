class AddRelTopicSubtopicTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :topics, :subtopics, table_name: :rel_topic_subtopic
  end
end
