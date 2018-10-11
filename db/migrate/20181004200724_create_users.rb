class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username, :null => false
      t.string :name, :null => false
      t.string :lastname, :null => false
      t.string :email, :null => false
      t.string :password_digest, :null => false
      t.string :user_token
      t.references :cities, foreign_key: true, :null => false
      t.string :score
      t.string :talk_to_us
      t.bigint :photos_id

      t.timestamps
    end
  end
end
