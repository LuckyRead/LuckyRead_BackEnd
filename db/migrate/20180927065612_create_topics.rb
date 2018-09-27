class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.integer :idtopic
      t.text :name
      t.integer :score

      t.timestamps
    end
  end
end
