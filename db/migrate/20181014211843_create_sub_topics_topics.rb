class CreateSubTopicsTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_topics_topics do |t|#, :id=>false
      t.references :topic
      t.references :sub_topic
      
      t.timestamps
    end
  end
end
