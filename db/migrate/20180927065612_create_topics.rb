class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics, id:false do |t|
      t.integer :idtopic, primary_key: true, :null => false
      t.text :name, :null => false
      t.integer :score, :default => 0
      
      t.timestamps
    end
  end
end
