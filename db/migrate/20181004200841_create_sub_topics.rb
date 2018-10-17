class CreateSubTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_topics do |t|
      t.string :sub_topic_name, :null => false

      t.timestamps
    end
  end
end
