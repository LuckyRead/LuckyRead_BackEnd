class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.string :topic_name, :null => false
      t.integer :score
      
      t.timestamps
    end
  end
end
