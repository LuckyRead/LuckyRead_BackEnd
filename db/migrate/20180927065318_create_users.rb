class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, id:false do |t|
      t.string :username, primary_key: true
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
