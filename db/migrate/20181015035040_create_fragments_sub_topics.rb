class CreateFragmentsSubTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :fragments_sub_topics do |t|#, :id=>false
      t.references :fragment
      t.references :sub_topic
      
      t.timestamps
    end
  end
end
