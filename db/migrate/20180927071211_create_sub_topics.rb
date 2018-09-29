class CreateSubTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_topics, id:false do |t|
      t.integer :idsub_topic, primary_key: true
      t.text :name

      t.timestamps
    end
  end
end
