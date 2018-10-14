class CreateSubTopicsTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_topics_topics, :id=>false do |t|
      t.references :topic
      t.references :sub_topic
      
      t.timestamps
    end
  end
end
