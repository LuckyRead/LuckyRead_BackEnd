class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.text :message, :null => false
      t.datetime :datetime, :null => false
      t.references :comments, foreign_key: true, :null => false
      t.references :users, foreign_key: true, :null => false

      t.timestamps
    end
  end
end
