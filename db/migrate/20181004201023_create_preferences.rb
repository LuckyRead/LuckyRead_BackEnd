class CreatePreferences < ActiveRecord::Migration[5.2]
  def change
    create_table :preferences do |t|
      t.references :users, foreign_key: true, :null => false
      t.references :sub_topics, foreign_key: true, :null => false
      t.integer :score

      t.timestamps
    end
  end
end
