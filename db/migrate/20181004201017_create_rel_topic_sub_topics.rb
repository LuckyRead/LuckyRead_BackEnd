class CreateRelTopicSubTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :rel_topic_sub_topics do |t|

      t.timestamps
    end
  end
end
