class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :message, :null => false
      t.datetime :datetime, :null => false
      t.references :user, foreign_key: true, :null => false #users
      t.references :fragment, foreign_key: true, :null => false #fragmentS
      t.string :likes, :null => false
      t.string :dislikes, :null => false

      t.timestamps
    end
  end
end
