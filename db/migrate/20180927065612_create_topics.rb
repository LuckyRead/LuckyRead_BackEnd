class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics, id:false do |t|
      t.integer :idtopic, primary_key: true
      t.text :name
      t.integer :score

      t.timestamps
    end
  end
end
