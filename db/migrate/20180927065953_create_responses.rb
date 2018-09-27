class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.integer :idresponse
      t.datetime :date
      t.text :message
      t.integer :comment_idcoment
      t.text :user_username

      t.timestamps
    end
  end
end
