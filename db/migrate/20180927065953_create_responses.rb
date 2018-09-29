class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses, id:false do |t|
      t.integer :idresponse, primary_key: true, :null => false
      t.datetime :date, :null => false
      t.text :message, :null => false
      t.integer :comment_idcoment, :null => false
      t.text :user_username, :null => false
      
      t.timestamps
    end
  end
end
