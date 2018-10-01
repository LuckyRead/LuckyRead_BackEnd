class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, id:false do |t|
      t.string :username, primary_key: true
      t.string :name, :null => false
      t.string :lastname, :null => false
      t.text :email, :null => false
      t.text :password, :null => false
      t.integer :score, :default => 0
      t.text :talk_to_us

      t.timestamps
    end
  end
end
