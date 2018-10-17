class CreateRelTopicSubTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :rel_topic_sub_topics do |t|
      t.references :topics, foreign_key: true, :null => false
      t.references :sub_topics, foreign_key: true, :null => false

      t.timestamps
    end
  end
end
