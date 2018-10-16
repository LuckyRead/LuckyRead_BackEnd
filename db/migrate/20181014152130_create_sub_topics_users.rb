class CreateSubTopicsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_topics_users, :id=>false do |t|
      t.references :user
      t.references :sub_topic
      t.integer :score
      
      t.timestamps
    end
  end
end
