class CreateSubtopics < ActiveRecord::Migration[5.2]
  def change
    create_table :subtopics, id:false do |t|
      t.integer :id_subtopic, primary_key: true
      t.string :name

      t.timestamps
    end
  end
end
