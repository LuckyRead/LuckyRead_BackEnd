class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :username
      t.string :name
      t.string :lastname
      t.text :email 
      t.text :password
      t.integer :score
      t.text :talk_to_us

      t.timestamps
    end
  end
end
