class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.string :topic_name, :null => false
      t.integer :score
      t.references :photos, foreign_key: true, :null => false
      
      t.timestamps
    end
  end
end
