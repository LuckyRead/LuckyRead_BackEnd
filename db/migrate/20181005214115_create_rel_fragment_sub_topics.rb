class CreateRelFragmentSubTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :rel_fragment_sub_topics do |t|
      t.references :fragments, foreign_key: true, :null => false
      t.references :sub_topics, foreign_key: true, :null => false

      t.timestamps
    end
  end
end
