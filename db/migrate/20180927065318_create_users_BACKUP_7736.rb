class CreateUsers < ActiveRecord::Migration[5.2]
  def change
<<<<<<< HEAD
    create_table :users, id:false do |t|
      t.string :username, primary_key: true
      t.string :name, :null => false
      t.string :lastname, :null => false
      t.text :email, :null => false
      t.text :password, :null => false
      t.integer :score, :default => 0
=======
    create_table :users do |t|
      t.text :username
      t.string :name
      t.string :lastname
      t.text :email 
      t.text :password
      t.integer :score
>>>>>>> feature/8-poblar-la-bd
      t.text :talk_to_us

      t.timestamps
    end
  end
end
