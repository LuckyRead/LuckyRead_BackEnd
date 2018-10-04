class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username, :null => false
      t.string :name, :null => false
      t.string :lastname, :null => false
      t.string :password, :null => false
      t.references :cities, foreign_key: true, :null => false
      t.string :score
      t.string :talk_to_us
      
      t.timestamps
    end
  end
end
