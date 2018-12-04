class CreateReactions < ActiveRecord::Migration[5.2]
  def change
    create_table :reactions do |t|
      t.references :users, foreign_key: true, :null => false
      t.references :fragments, foreign_key: true, :null => false
      t.bigint :reaction, foreign_key: true
      
      t.timestamps
    end
  end
end
